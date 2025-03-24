import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/viewer/stack/parent_data.dart';

// Based on the position widget, but is able to be created from an element
class RubricPositioned extends ParentDataWidget<RuPositionParentData> {
  const RubricPositioned({
    super.key,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    required super.child,
  });

  final double x;
  final double y;
  final double width;
  final double height;

  factory RubricPositioned.fromElement({
    required ElementModel element,
    required Widget child,
  }) {
    return RubricPositioned(
      x: element.x,
      y: element.y,
      width: element.width,
      height: element.height,
      child: child,
    );
  }

  @override
  void applyParentData(RenderObject renderObject) {
    assert(renderObject.parentData is RuPositionParentData);
    final RuPositionParentData parentData =
        renderObject.parentData! as RuPositionParentData;
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
