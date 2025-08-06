import 'package:flutter/material.dart';
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
  onSelect(bool selected) {
    if (selected) {
      editorState.showToolbar(
        widget.element,
        LinkTooltipWidget(
          element: widget.element,
          controller: controller,
          undoController: undoController,
          header: widget.header,
        ),
      );
    }
  }
}

class LinkReaderWidget extends StatelessWidget {
  final ElementModel element;
  const LinkReaderWidget({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    final properties = element.getProperties<LinkElementModel>();
    return GestureDetector(
      onTap: () async {
        print("Link Pressed");
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
