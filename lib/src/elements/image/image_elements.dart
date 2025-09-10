import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
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

class ImageEditorElementState extends FocusableState<ImageEditorElement> {
  @override
  ElementModel get element => widget.element;

  @override
  onFocus(bool focused) {
    if (focused) {
      editorState.showToolbar(
        widget.element,
        (element) => ImageTooltipWidget(element: element),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ImageReaderElement(
      canvas: editorState.canvas.value,
      element: widget.element,
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
  final CanvasModel canvas;
  const ImageReaderElement(
      {super.key, required this.element, required this.canvas});

  @override
  Widget build(BuildContext context) {
    final imageProperties = element.getProperties<ImageElementModel>();

    return AspectRatio(
      aspectRatio: imageProperties.aspectRatio,
      child: DecoratedBox(
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
      ),
    );
  }
}
