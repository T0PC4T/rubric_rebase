// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

/// Parent data for use with [RenderStack].
class RuPositionParentData extends ContainerBoxParentData<RenderBox> {
  double y;
  double x;
  double width;
  double height;

  RuPositionParentData(
    this.y,
    this.x,
    this.width,
    this.height,
  );

  // RuPositionParentData.fromElement(ElementModel element);

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
