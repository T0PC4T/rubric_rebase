import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/elements/base/states.dart';
import 'package:rubric/src/elements/html_text/html_controller.dart';
import 'package:rubric/src/elements/html_text/html_text_model.dart';
import 'package:rubric/src/elements/html_text/html_text_toolbar.dart';
import 'package:rubric/src/models/elements.dart';

class HtmlTextEditorElement extends StatefulWidget {
  final ElementModel element;
  final bool header;
  const HtmlTextEditorElement({super.key, required this.element}) : header = false;

  const HtmlTextEditorElement.header({super.key, required this.element}) : header = true;

  @override
  State<HtmlTextEditorElement> createState() => HtmlTextEditorElementState();
}

class HtmlTextEditorElementState<T extends HtmlTextEditorElement> extends FocusableState<T> {
  late HTMLEditorController controller;
  late ScrollController _scrollController;
  late FocusNode focusNode;
  late UndoHistoryController undoController;

  @override
  void initState() {
    final properties = widget.element.getProperties<HtmlTextElementModel>();
    controller = HTMLEditorController.fromText(properties.text);
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
        (element) => HtmlTextToolbarWidget(
          element: element,
          controller: controller,
          undoController: undoController,
          header: widget.header,
        ),
      );
      focusNode.requestFocus();
    } else {
      if (_changed) {
        editorState.canvas.updateProperties<HtmlTextElementModel>(widget.element, (properties) {
          return properties.copyWith(text: controller.toHtml()).toJson();
        }, saveStep: false);
        editorState.canvas.commit();
      }
    }
  }

  bool _changed = false;
  void onChange() {
    _changed = true;
  }

  @override
  void didUpdateWidget(HtmlTextEditorElement oldWidget) {
    final properties = widget.element.getProperties<HtmlTextElementModel>();
    final oldProperties = oldWidget.element.getProperties<HtmlTextElementModel>();
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
    final properties = widget.element.getProperties<HtmlTextElementModel>();

    return isFocused
        ? TextField(
            decoration: null,
            undoController: undoController,

            // spellCheckConfiguration: SpellCheckConfiguration(),
            cursorColor: Colors.black,
            keyboardType: TextInputType.multiline,
            scrollPadding: EdgeInsets.zero,
            selectionControls: DesktopTextSelectionControls(),
            maxLines: null,
            enableInteractiveSelection: true,
            readOnly: false,
            minLines: null,
            strutStyle: StrutStyle.disabled,

            scrollController: _scrollController,
            controller: controller,
            onChanged: (value) => onChange(),
            focusNode: focusNode,
          )
        : HtmlTextReaderWidget(element: element, ifEmpty: "Insert Text Here...", canvas: editorState.canvas.value);
  }
}

class HtmlTextReaderWidget extends StatelessWidget {
  final ElementModel element;
  final String ifEmpty;
  final CanvasModel canvas;
  const HtmlTextReaderWidget({super.key, required this.element, this.ifEmpty = "", required this.canvas});

  @override
  Widget build(BuildContext context) {
    final properties = element.getProperties<HtmlTextElementModel>();
    print(properties.text);

    return SizedBox(width: double.infinity, child: HtmlWidget(properties.text.isEmpty ? ifEmpty : properties.text));
  }
}
