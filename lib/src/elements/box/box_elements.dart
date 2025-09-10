import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/elements/base/states.dart';
import 'package:rubric/src/elements/box/box_model.dart';
import 'package:rubric/src/elements/box/box_toolbar.dart';
import 'package:rubric/src/models/elements.dart';

class BoxEditorElement extends StatefulWidget {
  final ElementModel element;
  const BoxEditorElement({super.key, required this.element});

  @override
  State<BoxEditorElement> createState() => BoxEditorElementState();
}

class BoxEditorElementState extends FocusableState<BoxEditorElement> {
  @override
  onFocus(bool focused) {
    if (focused) {
      editorState.showToolbar(
        widget.element,
        BoxTooltipWidget(element: widget.element),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final boxElement = widget.element.getProperties<BoxElementModel>();
    return AspectRatio(
      aspectRatio: boxElement.aspectRatio,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: boxElement.color,
          borderRadius: BorderRadius.circular(boxElement.borderRadius),
        ),
      ),
    );
  }

  @override
  ElementModel get element => widget.element;
}

class BoxReaderElement extends StatelessWidget {
  final ElementModel element;
  final CanvasModel canvas;
  const BoxReaderElement(
      {super.key, required this.element, required this.canvas});

  @override
  Widget build(BuildContext context) {
    final boxElement = element.getProperties<BoxElementModel>();
    return AspectRatio(
      aspectRatio: boxElement.aspectRatio,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: boxElement.color,
          borderRadius: BorderRadius.circular(boxElement.borderRadius),
        ),
      ),
    );
  }
}
