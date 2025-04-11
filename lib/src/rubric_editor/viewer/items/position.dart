import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/models/preview.dart';
import 'package:rubric/src/rubric_editor/viewer/stack/positioned.dart';

// Based on the position widget, but is able to be created from an element
class RubricPositioned extends ParentDataWidget<RubricPositionParentData> {
  const RubricPositioned({
    super.key,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    required this.fixed,
    required this.fixedWidth,
    this.handler = false,
    required super.child,
    required this.orderIndex,
    this.element,
  });

  final double x;
  final double y;
  final double width;
  final double height;
  final bool fixed;
  final double fixedWidth;
  // ? this means that something can be fixed without offset the other elements.
  final bool handler;
  final ElementModel? element;
  final int orderIndex;

  factory RubricPositioned.fromElement({
    required ViewModes viewMode,
    required ElementModel element,
    required Widget child,
    bool? fix,
    bool handler = false,
  }) {
    return RubricPositioned(
      x: element.getX(viewMode),
      y: element.getY(viewMode),
      width: element.getWidth(viewMode),
      height: element.getHeight(viewMode),
      fixed: element.fixed,
      fixedWidth: element.fixedWidth,
      handler: handler,
      element: element,
      orderIndex: element.orderIndex,
      child: child,
    );
  }

  @override
  void applyParentData(RenderObject renderObject) {
    assert(renderObject.parentData is RubricPositionParentData);
    final RubricPositionParentData parentData =
        renderObject.parentData! as RubricPositionParentData;
    bool needsLayout = false;

    if (parentData.x != x) {
      parentData.x = x;
      needsLayout = true;
    }

    if (parentData.y != y) {
      parentData.y = y;
      needsLayout = true;
    }

    if (parentData.width != width) {
      parentData.width = width;
      needsLayout = true;
    }

    if (parentData.height != height) {
      parentData.height = height;
      needsLayout = true;
    }

    if (parentData.fixed != fixed) {
      parentData.fixed = fixed;
      needsLayout = true;
    }

    if (parentData.fixedWidth != fixedWidth) {
      parentData.fixedWidth = fixedWidth;
      needsLayout = true;
    }

    if (parentData.handler != handler) {
      parentData.handler = handler;
      needsLayout = true;
    }

    if (parentData.element != element) {
      parentData.element = element;
      needsLayout = true;
    }

    if (parentData.orderIndex != orderIndex) {
      parentData.orderIndex = orderIndex;
      needsLayout = true;
    }

    if (needsLayout) {
      renderObject.parent?.markNeedsLayout();
    }
  }

  @override
  Type get debugTypicalAncestorWidgetClass => Stack;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('x', x, defaultValue: null));
    properties.add(DoubleProperty('y', y, defaultValue: null));
    properties.add(DoubleProperty('width', width, defaultValue: null));
    properties.add(DoubleProperty('height', height, defaultValue: null));
  }
}
