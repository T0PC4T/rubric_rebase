import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/models/elements.dart';

class ScalarRenderProxyBox extends RenderProxyBox {
  int scalarIndex;
  ElementModel element;
  ScalarRenderProxyBox({
    RenderBox? child,
    required this.element,
    required this.scalarIndex,
  }) : super(child);
}

// Example usage in a widget

class ScalarWidget extends StatelessWidget {
  final ElementModel element;
  final int scalarIndex;
  const ScalarWidget({
    super.key,
    required this.element,
    required this.scalarIndex,
  });

  static const double scalarSize = 15;
  @override
  Widget build(BuildContext context) {
    final style = RubricEditorStyle.of(context);
    return ScalarRenderWidget(
      element: element,
      scalarIndex: scalarIndex,
      child: Container(
        width: scalarSize,
        height: scalarSize,
        decoration: BoxDecoration(
          color: style.light,
          border: Border.all(width: 2, color: style.theme),
          // borderRadius: BorderRadius.circular(scalarSize),
        ),
      ),
    );
  }
}

class ScalarRenderWidget extends SingleChildRenderObjectWidget {
  final ElementModel element;
  final int scalarIndex;
  const ScalarRenderWidget({
    super.key,
    required this.element,
    required this.scalarIndex,
    required super.child,
  });

  @override
  void updateRenderObject(
    BuildContext context,
    ScalarRenderProxyBox renderObject,
  ) {
    renderObject.element = element;
    super.updateRenderObject(context, renderObject);
  }

  @override
  RenderObject createRenderObject(BuildContext context) {
    return ScalarRenderProxyBox(element: element, scalarIndex: scalarIndex);
  }
}
