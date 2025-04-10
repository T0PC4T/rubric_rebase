import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/models/preview.dart';
import 'package:rubric/src/rubric_editor/viewer/items/position.dart';

// todo this needs to be optimized in a way that the children aren't constantly being disposed.
class EditorElementWidget extends StatelessWidget {
  final ViewModes viewMode;
  final ElementModel element;

  const EditorElementWidget(
      {super.key, required this.element, required this.viewMode});

  @override
  Widget build(BuildContext context) {
    return RubricPositioned.fromElement(
      multiplier: 1,
      viewMode: viewMode,
      element: element,
      child: Padding(
        padding: EdgeInsets.all(element.padding),
        child: element.type.editorBuilder(element: element),
      ),
    );
  }
}

class ReaderElementWidget extends StatelessWidget {
  final ViewModes viewMode;
  final ElementModel element;

  const ReaderElementWidget(
      {super.key, required this.element, required this.viewMode});

  @override
  Widget build(BuildContext context) {
    return RubricPositioned.fromElement(
      multiplier: 1,
      viewMode: viewMode,
      element: element,
      child: Padding(
        padding: EdgeInsets.all(element.padding),
        child: element.type.readerBuilder(element: element),
      ),
    );
  }
}

class ElementHandlerRender extends RenderProxyBox {
  ElementModel element;

  ElementHandlerRender({RenderBox? child, required this.element})
      : super(child);

  @override
  bool hitTestSelf(Offset position) {
    // this ensure that no matter the visibility, element handler will register a hit preventing clicking through to an underlying widget.
    return true;
  }
}

class ElementHandlerRenderObjectWidget extends SingleChildRenderObjectWidget {
  final ElementModel element;

  const ElementHandlerRenderObjectWidget({
    super.key,
    required this.element,
    required super.child,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return ElementHandlerRender(element: element);
  }

  @override
  void updateRenderObject(
    BuildContext context,
    ElementHandlerRender renderObject,
  ) {
    // if (renderObject.element != element) {
    renderObject.element = element;
    renderObject.markNeedsLayout();
    // }
  }
}
