import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/rubric_icon/icons.dart';

class RubricEditorIcon extends StatelessWidget {
  final String name;
  final double? size;
  final Color? color;
  const RubricEditorIcon(this.name, {super.key, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return Icon(allIcons[name], size: size, color: color);
  }
}

class RubricIcon extends StatelessWidget {
  final IconData icon;
  final double? size;
  final Color? color;
  const RubricIcon(this.icon, {super.key, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    final editorState = RubricEditorState.of(context);
    return Icon(icon, size: size, color: color ?? editorState.style.fore);
  }
}
