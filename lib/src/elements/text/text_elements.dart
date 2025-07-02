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

    return Transform.translate(
      offset: Offset(0, -4),
      child: TextField(
        decoration:
            InputDecoration.collapsed(hintText: "Enter you text in here"),
        undoController: undoController,
        style: textStyle,
        cursorColor: Colors.black,
        keyboardType: TextInputType.multiline,
        scrollPadding: EdgeInsets.zero,
        textAlign: ElementAlignment.textAlign(properties.alignment),
        selectionControls: DesktopTextSelectionControls(),
        maxLines: null,
        enableInteractiveSelection: true,
        readOnly: false,
        minLines: null,
        onChanged: _onChange,
        scrollController: _scrollController,
        controller: controller,
        focusNode: focusNode,
      ),
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
      style: textElement.textStyle().copyWith(fontSize: 14),
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
      overflow: TextOverflow.visible,
      properties.text,
      textAlign: ElementAlignment.textAlign(properties.alignment),
      style: properties.textStyle(),
    );
  }
}
