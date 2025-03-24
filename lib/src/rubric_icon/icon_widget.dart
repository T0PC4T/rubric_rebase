import 'package:flutter/material.dart';
import 'package:rubric/src/rubric_icon/icons.dart';

class RubricIcon extends StatelessWidget {
  final String name;
  final double? size;
  final Color? color;
  const RubricIcon(this.name, {super.key, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return Icon(
      allIcons[name],
      size: size,
      color: color,
    );
  }
}
