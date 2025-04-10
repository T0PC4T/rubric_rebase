import 'package:flutter/material.dart';
import 'package:rubric/src/rubric_editor/models/style.dart';

class RubricVerticleDivider extends StatelessWidget {
  const RubricVerticleDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final style = RubricEditorStyle.of(context);
    return VerticalDivider(
      thickness: 1,
      color: style.light7,
      width: RubricEditorStyle.paddingNum * 0.5,
      indent: RubricEditorStyle.paddingNum * 0.5,
      endIndent: RubricEditorStyle.paddingNum * 0.5,
    );
  }
}
