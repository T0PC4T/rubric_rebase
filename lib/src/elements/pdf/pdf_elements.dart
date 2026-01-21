import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/elements/base/states.dart';
import 'package:rubric/src/elements/pdf/pdf_model.dart';
import 'package:rubric/src/elements/pdf/pdf_toolbar.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_icon/icon_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PdfEditorElement extends StatefulWidget {
  final ElementModel element;
  const PdfEditorElement({super.key, required this.element});

  @override
  State<PdfEditorElement> createState() => PdfEditorElementState();
}

class PdfEditorElementState extends FocusableState<PdfEditorElement> {
  @override
  ElementModel get element => widget.element;

  @override
  onFocus(bool focused) {
    if (focused) {
      editorState.showToolbar(widget.element, (element) => PdfTooltipWidget(element: element));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 12,
      child: Container(
        color: const Color.fromARGB(255, 89, 89, 89),
        alignment: Alignment.center,
        child: FittedBox(child: RubricIcon(Icons.picture_as_pdf, color: editorState.style.back, size: 50)),
      ),
    );
  }
}

class PdfReaderElement extends StatefulWidget {
  final ElementModel element;
  final CanvasModel canvas;
  const PdfReaderElement({super.key, required this.element, required this.canvas});

  @override
  State<PdfReaderElement> createState() => PdfReaderElementState();
}

class PdfReaderElementState extends State<PdfReaderElement> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    final properties = widget.element.getProperties<PdfElementModel>();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse("${properties.pdfUrl}#toolbar=0"));
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 12,
      child: WebViewWidget(controller: controller),
    );
  }
}
