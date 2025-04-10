import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/elements/base/states.dart';
import 'package:rubric/src/elements/text/text_model.dart';
import 'package:rubric/src/elements/text/text_toolbar.dart';
import 'package:rubric/src/models/elements.dart';

class TextEditorElement extends StatefulWidget {
  final ElementModel element;
  const TextEditorElement({super.key, required this.element});

  @override
  State<TextEditorElement> createState() => TextEditorElementState();
}

class TextEditorElementState
    extends SelectableAndFocusableState<TextEditorElement> {
  late TextEditingController controller;
  late ScrollController _scrollController;
  late FocusNode focusNode;
  late UndoHistoryController undoController;

  @override
  void initState() {
    final textProperties = widget.element.getProperties<TextElementModel>();
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
      focusNode.requestFocus();
    } else {
      final properties = widget.element.getProperties<TextElementModel>();
      editorState.canvas.updateElement(
        widget.element,
        properties.copyWith(text: controller.text).toJson(),
      );
    }
  }

  @override
  void didUpdateWidget(covariant TextEditorElement oldWidget) {
    // TODO update this widget correctly

    super.didUpdateWidget(oldWidget);
  }

  @override
  onSelect(bool selected) {
    if (selected) {
      editorState.showToolbar(
        widget.element,
        TextTooltipWidget(
            element: widget.element,
            controller: controller,
            undoController: undoController),
      );
    }
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
    final textElement = widget.element.getProperties<TextElementModel>();
    final textStyle = textElement.textStyle();
    editorState = RubricEditorState.of(context);
    if (textElement.text.isEmpty && !editorState.edits.isFocused(element)) {
      return Text("[Enter you text in here]", style: textStyle);
    }
    return EditableText(
      undoController: undoController,
      style: textStyle,
      cursorColor: Colors.black,
      backgroundCursorColor: Colors.black,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      textAlign: TextAlign.start,
      selectionColor: Colors.blue.withAlpha(50),
      selectionControls: materialTextSelectionControls,
      rendererIgnoresPointer: false,
      readOnly: false,
      // autocorrect: true,
      // enableSuggestions: true,
      // expands: true,
      minLines: null,
      // obscureText: false,
      // showCursor: true,
      // cursorWidth: 2,
      // cursorRadius: Radius.circular(2),
      // textInputAction: TextInputAction.newline,
      // textCapitalization: TextCapitalization.sentences,
      onChanged: (value) {
        // editorState.canvas.updateElement(
        //   widget.element,
        //   TextElementModel(
        //           text: value,
        //           color: Colors.black,
        //           isBold: false,
        //           size: 12)
        //       .toJson(),
        // );
      },
      scrollController: _scrollController,
      controller: controller,
      focusNode: focusNode,
    );
  }
}

class TextLayerWidget extends StatelessWidget {
  final ElementModel element;
  const TextLayerWidget({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    final style = RubricEditorStyle.of(context);
    final textElement = element.getProperties<TextElementModel>();
    return Text(
      maxLines: 1,
      textElement.text,
      style: textElement.textStyle(),
      overflow: TextOverflow.ellipsis,
    );
  }
}

class TextReaderWidget extends StatelessWidget {
  final ElementModel element;
  const TextReaderWidget({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    final properties = element.getProperties<TextElementModel>();
    return Text(
      properties.text,
      style: properties.textStyle(),
    );
  }
}
