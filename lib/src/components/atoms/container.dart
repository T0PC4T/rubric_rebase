import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';

class RubricContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  const RubricContainer({
    super.key,
    required this.child,
    required this.height,
    required this.width,
    this.color,
    this.margin,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final style = RubricEditorStyle.of(context);

    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? style.back,
        border: Border.all(color: style.fore4, width: 1),
        borderRadius: style.borderRadius,
      ),
      height: height,
      width: width,
      child: child,
    );
  }
}
