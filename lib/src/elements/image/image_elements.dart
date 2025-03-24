import 'package:flutter/material.dart';
import 'package:rubric/src/elements/base/states.dart';
import 'package:rubric/src/elements/image/image_model.dart';
import 'package:rubric/src/elements/image/image_toolbar.dart';
import 'package:rubric/src/models/elements.dart';

class ImageEditorElement extends StatefulWidget {
  final ElementModel element;
  const ImageEditorElement({super.key, required this.element});

  @override
  State<ImageEditorElement> createState() => ImageEditorElementState();
}

class ImageEditorElementState extends SelectableState<ImageEditorElement> {
  @override
  ElementModel get element => widget.element;

  @override
  onSelect(bool selected) {
    if (selected) {
      editorState.showToolbar(
        widget.element,
        ImageTooltipWidget(element: widget.element),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageProperties = widget.element.getProperties<ImageElementModel>();
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageProperties.imageUrl),
          fit: switch (imageProperties.fit) {
            "cover" => BoxFit.cover,
            "contain" => BoxFit.contain,
            "fill" => BoxFit.fill,
            _ => BoxFit.contain,
          },
        ),
        borderRadius: BorderRadius.circular(imageProperties.borderRadius),
      ),
    );
  }
}

class ImageLayerElement extends StatelessWidget {
  final ElementModel element;
  const ImageLayerElement({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    final imageProperties = element.getProperties<ImageElementModel>();
    return Image.network(imageProperties.imageUrl);
  }
}

class ImageReaderElement extends StatelessWidget {
  final ElementModel element;
  const ImageReaderElement({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    final imageProperties = element.getProperties<ImageElementModel>();
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageProperties.imageUrl),
          fit: switch (imageProperties.fit) {
            "cover" => BoxFit.cover,
            "contain" => BoxFit.contain,
            "fill" => BoxFit.fill,
            _ => BoxFit.contain,
          },
        ),
        borderRadius: BorderRadius.circular(imageProperties.borderRadius),
      ),
    );
  }
}
