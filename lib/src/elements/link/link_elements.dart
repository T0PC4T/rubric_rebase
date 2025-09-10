import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/elements/base/enums.dart';
import 'package:rubric/src/elements/link/link_model.dart';
import 'package:rubric/src/elements/link/link_toolbar.dart';
import 'package:rubric/src/elements/text/text_elements.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkEditorElement extends TextEditorElement {
  const LinkEditorElement({super.key, required super.element});

  @override
  State<LinkEditorElement> createState() => LinkEditorElementState();
}

class LinkEditorElementState extends TextEditorElementState<LinkEditorElement> {
  @override
  onFocus(bool focused) {
    if (focused) {
      editorState.showToolbar(
        widget.element,
        (element) => LinkTooltipWidget(
          element: element,
          controller: controller,
          undoController: undoController,
          header: widget.header,
        ),
      );
      focusNode.requestFocus();
    } else {
      super.onFocus(focused);
    }
  }
}

class LinkReaderWidget extends StatelessWidget {
  final ElementModel element;
  final CanvasModel canvas;
  const LinkReaderWidget(
      {super.key, required this.element, required this.canvas});

  @override
  Widget build(BuildContext context) {
    final properties = element.getProperties<LinkElementModel>();
    return GestureDetector(
      onTap: () async {
        if (properties.link.isEmpty) {
          return;
        }
        String link = properties.link;
        if (!link.startsWith("http")) {
          link = "https://$link";
        }
        await launchUrl(
          Uri.parse(link),
          webOnlyWindowName: '_blank',
        );
      },
      child: Text(
        overflow: TextOverflow.visible,
        properties.text,
        textAlign: ElementAlignment.textAlign(properties.alignment),
        style: properties.textStyle(),
      ),
    );
  }
}
