import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/viewer/items/position.dart';

// todo this needs to be optimized in a way that the children aren't constantly being disposed.
class ElementWidget extends StatelessWidget {
  final ElementModel element;
  const ElementWidget({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    return RubricPositioned.fromElement(
      element: element,
      child: element.type.editorBuilder(element: element),
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
