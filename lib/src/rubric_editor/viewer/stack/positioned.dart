// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:rubric/src/models/elements.dart';

/// Parent data for use with [RenderStack].
class RubricPositionParentData extends ContainerBoxParentData<RenderBox> {
  double y;
  double x;
  double width;
  double height;
  bool fixed;
  double fixedWidth;
  bool handler;
  int orderIndex;
  ElementModel? element;

  RubricPositionParentData({
    this.element,
    this.handler = false,
    required this.y,
    required this.x,
    required this.width,
    required this.height,
    required this.fixed,
    required this.fixedWidth,
    required this.orderIndex,
  });

  BoxConstraints positionedChildConstraints(Size stackSize) {
    if (width.isInfinite) {
      return BoxConstraints.tightFor(
        width: stackSize.width,
        height: stackSize.height,
      );
    }
    return BoxConstraints.tightFor(width: width, height: height);
  }

  @override
  String toString() {
    final List<String> values = <String>[
      'top=${debugFormatDouble(x)}',
      'right=${debugFormatDouble(y)}',
      'width=${debugFormatDouble(width)}',
      'height=${debugFormatDouble(height)}',
    ];
    values.add(super.toString());
    return values.join('; ');
  }
}
