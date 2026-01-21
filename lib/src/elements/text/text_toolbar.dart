import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/components/atoms/divider.dart';
import 'package:rubric/src/components/atoms/popup.dart';
import 'package:rubric/src/components/molecules/color_picker.dart';
import 'package:rubric/src/components/shared.dart';
import 'package:rubric/src/elements/base/enums.dart';
import 'package:rubric/src/elements/text/text_model.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/toolbar/dropdown.dart';
import 'package:rubric/src/rubric_editor/toolbar/element_toolbar.dart';

const _markers = ['ᵇ', 'ⁱ', 'ᵘ'];

// Converted to a StatefulWidget to manage the button enabled/disabled state.
class TextToolbarWidget extends StatefulWidget {
  final ElementModel element;
  final TextEditingController controller;
  final UndoHistoryController undoController;
  final bool header;

  const TextToolbarWidget({
    super.key,
    required this.element,
    required this.controller,
    required this.undoController,
    required this.header,
  });

  @override
  State<TextToolbarWidget> createState() => _TextToolbarWidgetState();
}

class _TextToolbarWidgetState extends State<TextToolbarWidget> {
  // State variable to track if the formatting buttons should be active.
  bool _isStylingEnabled = false;

  @override
  void initState() {
    super.initState();
    // Listen to the controller to validate the selection in real-time.
    widget.controller.addListener(_validateSelection);
    // Run an initial validation check.
    _validateSelection();
  }

  @override
  void dispose() {
    // Clean up the listener when the widget is removed.
    widget.controller.removeListener(_validateSelection);
    super.dispose();
  }

  /// Checks if the current text selection is valid for styling.
  void _validateSelection() {
    final selection = widget.controller.selection;
    bool isCurrentlyValid = true;

    // A selection is only valid if it's not collapsed.
    if (selection.isCollapsed) {
      // means it is entire text
      isCurrentlyValid = true;
    } else {
      final selectedText = selection.textInside(widget.controller.text);

      // A selection is INVALID if it contains an odd number of any marker,
      // as this indicates it crosses a style boundary.
      for (final marker in _markers) {
        final count = marker.allMatches(selectedText).length;
        if (count % 2 != 0) {
          isCurrentlyValid = false;
          break; // Found an invalid state, no need to check others.
        }
      }
    }

    // Only call setState if the validity has actually changed to avoid
    // unnecessary rebuilds.
    if (_isStylingEnabled != isCurrentlyValid) {
      setState(() {
        _isStylingEnabled = isCurrentlyValid;
      });
    }
  }

  // This helper function is now part of the State class.
  void _toggleWrapSelectionWith(String char, RubricEditorState editorState) {
    TextSelection selection = widget.controller.selection;
    // This check is technically redundant now since the button will be disabled,
    // but it's good practice to keep it as a safeguard.

    if (selection.isCollapsed) {
      widget.controller.selection = TextSelection(baseOffset: 0, extentOffset: widget.controller.text.length);
      selection = widget.controller.selection;
    }

    String newText = widget.controller.text;
    final selectedText = selection.textInside(widget.controller.text);

    if (selectedText.contains(char)) {
      newText = widget.controller.text.replaceRange(selection.start, selection.end, selectedText.replaceAll(char, ""));
    } else {
      newText = widget.controller.text.replaceRange(selection.start, selection.end, '$char$selectedText$char');
    }

    widget.controller.text = newText;
    editorState.canvas.updateProperties<TextElementModel>(widget.element, (properties) {
      return properties.copyWith(text: widget.controller.text).toJson();
    });
  }

  @override
  Widget build(BuildContext context) {
    final editorState = RubricEditorState.of(context);
    final properties = widget.element.getProperties<TextElementModel>();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // The onTap callback is now conditional based on our state variable.
        // Passing `null` to onTap disables the button.
        RubricIconButton(
          size: ElementToolbarWidget.elementToolbarHeight,
          onTap: _isStylingEnabled ? () => _toggleWrapSelectionWith('ᵇ', editorState) : null,
          iconData: Icons.format_bold,
          disabled: !_isStylingEnabled,
        ),
        RubricIconButton(
          size: ElementToolbarWidget.elementToolbarHeight,
          onTap: _isStylingEnabled ? () => _toggleWrapSelectionWith('ⁱ', editorState) : null,
          iconData: Icons.format_italic,
          disabled: !_isStylingEnabled,
        ),
        RubricIconButton(
          size: ElementToolbarWidget.elementToolbarHeight,
          onTap: _isStylingEnabled ? () => _toggleWrapSelectionWith('ᵘ', editorState) : null,
          iconData: Icons.format_underline,
          disabled: !_isStylingEnabled,
        ),

        // --- The rest of your toolbar remains the same ---
        RubricVerticleDivider(),
        for (var align in ElementAlignment.all)
          RubricIconButton(
            isActive: properties.alignment == align,
            size: ElementToolbarWidget.elementToolbarHeight,
            onTap: () {
              editorState.canvas.updateProperties<TextElementModel>(
                widget.element,
                (properties) => properties.copyWith(alignment: align).toJson(),
              );
            },
            iconData: ElementAlignment.icon(align),
          ),
        RubricVerticleDivider(),
        Padding(
          padding: RubricEditorStyle.padding,
          child: RubricColorButton(
            color: properties.color,
            onTap: () async {
              final newColor = await PopupWidget.showPopup<Color>(context, (closeWith) {
                return RubricColorPicker(onComplete: closeWith, color: properties.color);
              });
              if (newColor != null) {
                editorState.canvas.updateProperties<TextElementModel>(
                  widget.element,
                  (properties) => properties.copyWith(color: newColor).toJson(),
                );
              }
            },
          ),
        ),
        RubricToolbarDropdown(
          onUpdate: (value) {
            if (value case double newValue) {
              editorState.canvas.updateProperties<TextElementModel>(
                widget.element,
                (properties) => properties.copyWith(size: newValue).toJson(),
              );
            }
          },
          items: [
            if (widget.header)
              for (var value in HeadingFontSizes.values) RubricDropdownMenuItem(value: value.value, text: value.display)
            else
              for (var value in FontSizes.values) RubricDropdownMenuItem(value: value.value, text: value.display),
          ],
          child: RubricText("Font Size"),
        ),
        ToolbarUniversalIcons(element: widget.element),
      ],
    );
  }
}
