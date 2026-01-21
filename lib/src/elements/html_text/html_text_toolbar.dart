import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/components/atoms/divider.dart';
import 'package:rubric/src/components/atoms/popup.dart';
import 'package:rubric/src/components/molecules/color_picker.dart';
import 'package:rubric/src/components/shared.dart';
import 'package:rubric/src/elements/html_text/html_controller.dart';
import 'package:rubric/src/elements/html_text/html_text_model.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/toolbar/dropdown.dart';
import 'package:rubric/src/rubric_editor/toolbar/element_toolbar.dart';

class HtmlTextToolbarWidget extends StatefulWidget {
  final ElementModel element;
  final HTMLEditorController controller;
  final UndoHistoryController undoController;
  final bool header;

  const HtmlTextToolbarWidget({
    super.key,
    required this.element,
    required this.controller,
    required this.undoController,
    required this.header,
  });

  @override
  State<HtmlTextToolbarWidget> createState() => _HtmlTextToolbarWidgetState();
}

class _HtmlTextToolbarWidgetState extends State<HtmlTextToolbarWidget> {
  final bool _isBoldActive = false;
  final bool _isItalicActive = false;
  final bool _isUnderlineActive = false;
  double? _currentFontSize;
  final Color _currentColor = Colors.black;
  final Color _currentBackgroundColor = Colors.transparent;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _setAlignment(HtmlTextAlign alignment) {
    final editorState = RubricEditorState.of(context);
    editorState.canvas.updateProperties<HtmlTextElementModel>(widget.element, (properties) {
      return properties.copyWith(textAlign: alignment).toJson();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        RubricIconButton(
          size: ElementToolbarWidget.elementToolbarHeight,
          onTap: () {
            widget.controller.toggleBold();
          },
          iconData: Icons.format_bold,
          isActive: _isBoldActive,
        ),
        RubricIconButton(
          size: ElementToolbarWidget.elementToolbarHeight,
          onTap: () {
            widget.controller.toggleItalic();
          },
          iconData: Icons.format_italic,
          isActive: _isItalicActive,
        ),
        RubricIconButton(
          size: ElementToolbarWidget.elementToolbarHeight,
          onTap: () {
            widget.controller.toggleUnderline();
          },
          iconData: Icons.format_underline,
          isActive: _isUnderlineActive,
        ),
        RubricVerticleDivider(),
        RubricIconButton(
          size: ElementToolbarWidget.elementToolbarHeight,
          onTap: () => _setAlignment(HtmlTextAlign.left),
          iconData: Icons.format_align_left,
          isActive: widget.element.getProperties<HtmlTextElementModel>().textAlign == HtmlTextAlign.left,
        ),
        RubricIconButton(
          size: ElementToolbarWidget.elementToolbarHeight,
          onTap: () => _setAlignment(HtmlTextAlign.center),
          iconData: Icons.format_align_center,
          isActive: widget.element.getProperties<HtmlTextElementModel>().textAlign == HtmlTextAlign.center,
        ),
        RubricIconButton(
          size: ElementToolbarWidget.elementToolbarHeight,
          onTap: () => _setAlignment(HtmlTextAlign.right),
          iconData: Icons.format_align_right,
          isActive: widget.element.getProperties<HtmlTextElementModel>().textAlign == HtmlTextAlign.right,
        ),
        RubricIconButton(
          size: ElementToolbarWidget.elementToolbarHeight,
          onTap: () => _setAlignment(HtmlTextAlign.justify),
          iconData: Icons.format_align_justify,
          isActive: widget.element.getProperties<HtmlTextElementModel>().textAlign == HtmlTextAlign.justify,
        ),
        RubricVerticleDivider(),
        Padding(
          padding: RubricEditorStyle.padding,
          child: RubricColorButton(
            color: _currentColor,
            onTap: () async {
              final newColor = await PopupWidget.showPopup<Color>(context, (closeWith) {
                return RubricColorPicker(onComplete: closeWith, color: _currentColor);
              });
              if (newColor != null) {
                widget.controller.setTextColor(newColor);
              }
            },
          ),
        ),
        RubricToolbarDropdown(
          onUpdate: (value) {
            if (value case double newValue) {
              widget.controller.setFontSize(newValue);
            }
          },
          items: widget.controller.fontSizes
              .map((size) => RubricDropdownMenuItem(value: size, text: size.toString()))
              .toList(),
          child: RubricText(_currentFontSize?.toString() ?? "Font Size"),
        ),
        Padding(
          padding: RubricEditorStyle.padding,
          child: RubricColorButton(
            color: _currentBackgroundColor,
            onTap: () async {
              final newColor = await PopupWidget.showPopup<Color>(context, (closeWith) {
                return RubricColorPicker(onComplete: closeWith, color: _currentBackgroundColor);
              });
              if (newColor != null) {
                widget.controller.setBackgroundColor(newColor);
              }
            },
          ),
        ),
        ToolbarUniversalIcons(element: widget.element),
      ],
    );
  }
}
