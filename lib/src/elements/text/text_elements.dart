import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/elements/base/enums.dart';
import 'package:rubric/src/elements/base/states.dart';
import 'package:rubric/src/elements/link/link_model.dart';
import 'package:rubric/src/elements/text/text_model.dart';
import 'package:rubric/src/elements/text/text_toolbar.dart';
import 'package:rubric/src/models/elements.dart';

class TextEditorElement extends StatefulWidget {
  final ElementModel element;
  final bool header;
  const TextEditorElement({super.key, required this.element}) : header = false;

  const TextEditorElement.header({super.key, required this.element})
      : header = true;

  @override
  State<TextEditorElement> createState() => TextEditorElementState();
}

class TextEditorElementState<T extends TextEditorElement>
    extends FocusableState<T> {
  late TextEditingController controller;
  late ScrollController _scrollController;
  late FocusNode focusNode;
  late UndoHistoryController undoController;

  @override
  void initState() {
    final textProperties = widget.element.getProperties<TextElementBaseModel>();
    controller = TextEditingController(text: textProperties.text);
    focusNode = FocusNode(debugLabel: "Text ${widget.element.id}");
    _scrollController = ScrollController();
    undoController = UndoHistoryController();

    super.initState();
  }

  @override
  ElementModel get element => widget.element;

  @override
  void onFocus(bool focused) {
    if (focused) {
      editorState.showToolbar(
        widget.element,
        TextToolbarWidget(
          element: widget.element,
          controller: controller,
          undoController: undoController,
          header: widget.header,
        ),
      );
      focusNode.requestFocus();
    } else {
      final properties = widget.element.getProperties<TextElementBaseModel>();
      switch (properties) {
        case TextElementModel textElement:
          {
            editorState.canvas.updateProperties(
              widget.element,
              textElement.copyWith(text: controller.text).toJson(),
            );
          }
        case LinkElementModel linkElement:
          {
            editorState.canvas.updateProperties(
              widget.element,
              linkElement.copyWith(text: controller.text).toJson(),
            );
          }
      }
    }
  }

  @override
  void didUpdateWidget(covariant TextEditorElement oldWidget) {
    final properties = widget.element.getProperties<TextElementBaseModel>();

    final oldProperties =
        oldWidget.element.getProperties<TextElementBaseModel>();
    if (properties.text != oldProperties.text) {
      controller.text = properties.text;
    }

    super.didUpdateWidget(oldWidget as T);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final properties = widget.element.getProperties<TextElementBaseModel>();
    final textStyle = properties.textStyle();
    editorState = RubricEditorState.of(context);

    return isFocused
        ? TextField(
            decoration: InputDecoration.collapsed(
                hintText: "[Empty Text]",
                hintStyle: TextStyle(color: Colors.black.withAlpha(100))),
            undoController: undoController,
            style: textStyle,
            // spellCheckConfiguration: SpellCheckConfiguration(),
            cursorColor: Colors.black,
            keyboardType: TextInputType.multiline,
            scrollPadding: EdgeInsets.zero,
            textAlign: ElementAlignment.textAlign(properties.alignment),
            selectionControls: DesktopTextSelectionControls(),
            maxLines: null,
            enableInteractiveSelection: true,
            readOnly: false,
            minLines: null,
            scrollController: _scrollController,
            controller: controller,
            focusNode: focusNode,
          )
        : TextReaderWidget(element: element);
  }
}

class TextReaderWidget extends StatelessWidget {
  final ElementModel element;
  const TextReaderWidget({super.key, required this.element});

  /// Recursively parses the raw text to handle nested styles.
  List<TextSpan> _parseText(String rawText, TextStyle baseStyle) {
    // Define the markers we are looking for.
    final Map<String, TextStyle> markers = {
      'ᵇ': baseStyle.copyWith(fontWeight: FontWeight.bold),
      'ᵘ': baseStyle.copyWith(decoration: TextDecoration.underline),
      'ⁱ': baseStyle.copyWith(fontStyle: FontStyle.italic),
    };

    final List<TextSpan> spans = [];

    // Base case: If the text is empty, there's nothing to do.
    if (rawText.isEmpty) {
      return spans;
    }

    // Find the first occurrence of any marker.
    int firstMatchIndex = -1;
    String? firstMarker;

    for (var marker in markers.keys) {
      final index = rawText.indexOf(marker);
      if (index != -1 && (firstMatchIndex == -1 || index < firstMatchIndex)) {
        firstMatchIndex = index;
        firstMarker = marker;
      }
    }

    // If no markers are found, this is plain text.
    if (firstMarker == null) {
      spans.add(TextSpan(text: rawText, style: baseStyle));
      return spans;
    }

    // Find the corresponding closing marker.
    final closingIndex = rawText.indexOf(firstMarker, firstMatchIndex + 1);

    // If no closing marker is found, treat the first marker as plain text.
    if (closingIndex == -1) {
      spans.add(TextSpan(text: rawText, style: baseStyle));
      return spans;
    }

    // 1. Add the plain text before the first marker.
    if (firstMatchIndex > 0) {
      spans.add(TextSpan(
        text: rawText.substring(0, firstMatchIndex),
        style: baseStyle,
      ));
    }

    // 2. Recursively parse the text *inside* the markers with the new style.
    final innerText = rawText.substring(firstMatchIndex + 1, closingIndex);
    final newStyle = markers[firstMarker]!;
    spans.addAll(_parseText(innerText, newStyle));

    // 3. Recursively parse the rest of the string *after* the markers.
    final restOfText = rawText.substring(closingIndex + 1);
    spans.addAll(_parseText(restOfText, baseStyle));

    return spans;
  }

  @override
  Widget build(BuildContext context) {
    final properties = element.getProperties<TextElementBaseModel>();
    final baseStyle = properties.textStyle();

    return Container(
      constraints: BoxConstraints(
          minHeight: max(baseStyle.fontSize ?? 0, 25) * 2,
          minWidth: double.infinity),
      child: RichText(
        textAlign: ElementAlignment.textAlign(properties.alignment),
        text: TextSpan(
          // The children are now generated by the powerful recursive parser.
          children: _parseText(properties.text, baseStyle),
        ),
      ),
    );
  }
}
