import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
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
  late QuillController controller;
  late ScrollController _scrollController;
  late FocusNode focusNode;

  @override
  void initState() {
    final textElement = widget.element.getProperties<TextElementModel>();
    focusNode = FocusNode(debugLabel: "Text ${widget.element.id}");
    _scrollController = ScrollController();
    controller = QuillController(
      document: textElement.document,
      selection: TextSelection(baseOffset: 0, extentOffset: 0),
      readOnly: false,
      editorFocusNode: focusNode,
      keepStyleOnNewLine: true,
      configurations: QuillControllerConfigurations(),
    );
    super.initState();
  }

  @override
  ElementModel get element => widget.element;

  @override
  void onFocus(bool focused) {
    if (focused) {
      editorState.showToolbar(
        widget.element,
        TextTooltipWidget(element: widget.element, controller: controller),
      );
      focusNode.requestFocus();
    } else {
      controller.updateSelection(
        TextSelection.collapsed(offset: 0),
        ChangeSource.local,
      );

      editorState.canvas.updateElement(
        widget.element,
        TextElementModel(document: controller.document).toJson(),
      );
    }
  }

  @override
  void didUpdateWidget(covariant TextEditorElement oldWidget) {
    final properties = widget.element.getProperties<TextElementModel>();
    final oldProperties = oldWidget.element.getProperties<TextElementModel>();
    if (properties.document.toDelta() != oldProperties.document.toDelta()) {
      controller.document = properties.document;
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  onSelect(bool selected) {
    if (selected) {
      // ? this replaces the usual show toolbar because there is no tool bar on select.
      editorState.clearOverlays();
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
    editorState = RubricEditorState.of(context);
    return QuillEditor(
      scrollController: _scrollController,
      controller: controller,
      focusNode: focusNode,
      configurations: QuillEditorConfigurations(
        placeholder: "Add your text in here...",
        customStyles: DefaultStyles(
            paragraph: DefaultTextBlockStyle(
                TextStyle(
                  color: Colors.black,
                  fontSize: RubricEditorStyle.minimumFontSize.toDouble(),
                ),
                HorizontalSpacing(0, 16),
                VerticalSpacing(0, 16),
                VerticalSpacing(16, 0),
                null)),
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
      maxLines: 2,
      textElement.document.toPlainText(),
      style: TextStyle(color: style.dark, fontSize: 14),
      overflow: TextOverflow.ellipsis,
    );
  }
}

class TextReaderWidget extends StatefulWidget {
  final ElementModel element;
  const TextReaderWidget({super.key, required this.element});

  @override
  State<TextReaderWidget> createState() => _TextReaderWidgetState();
}

class _TextReaderWidgetState extends State<TextReaderWidget> {
  late QuillController controller;
  late ScrollController _scrollController;
  late FocusNode focusNode;

  @override
  void initState() {
    final textElement = widget.element.getProperties<TextElementModel>();
    focusNode = FocusNode(debugLabel: "Text ${widget.element.id}");
    _scrollController = ScrollController();
    controller = QuillController(
      document: textElement.document,
      selection: TextSelection(baseOffset: 0, extentOffset: 0),
      readOnly: true,
      editorFocusNode: focusNode,
      configurations: QuillControllerConfigurations(),
    );
    super.initState();
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
    return IgnorePointer(
      child: QuillEditor(
        scrollController: _scrollController,
        controller: controller,
        focusNode: focusNode,
        configurations: QuillEditorConfigurations(),
      ),
    );
  }
}
