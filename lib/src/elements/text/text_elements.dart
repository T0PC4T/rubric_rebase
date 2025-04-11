import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/elements/base/enums.dart';
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

  double _oldHeight = 0;
  _onChange(String value) {
    final box = (context.findRenderObject() as RenderBox);
    if (_oldHeight != box.size.height) {
      _oldHeight = box.size.height;
      final properties = widget.element.getProperties<TextElementModel>();
      editorState.canvas.updateElement(
        widget.element,
        properties.copyWith(text: controller.text).toJson(),
      );
    }
  }

  @override
  void didUpdateWidget(covariant TextEditorElement oldWidget) {
    final properties = widget.element.getProperties<TextElementModel>();
    final oldProperties = oldWidget.element.getProperties<TextElementModel>();
    if (properties.text != oldProperties.text) {
      controller.text = properties.text;
    }

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
    final properties = widget.element.getProperties<TextElementModel>();
    final textStyle = properties.textStyle();
    editorState = RubricEditorState.of(context);
    if (properties.text.isEmpty && !editorState.edits.isFocused(element)) {
      return Text(
        "[Enter you text in here]",
        style: textStyle,
        textAlign: ElementAlignment.textAlign(properties.alignment),
      );
    }
    return EditableText(
      undoController: undoController,
      style: textStyle,
      cursorColor: Colors.black,
      backgroundCursorColor: Colors.black,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      textAlign: ElementAlignment.textAlign(properties.alignment),
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
      onChanged: _onChange,
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
      textAlign: ElementAlignment.textAlign(properties.alignment),
      style: properties.textStyle(),
    );
  }
}
