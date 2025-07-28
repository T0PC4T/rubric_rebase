import 'package:flutter/material.dart';
import 'package:rubric/src/components/shared.dart';
import 'package:rubric/src/elements/elements.dart';
import 'package:rubric/src/rubric_editor/models/style.dart';
import 'package:rubric/src/rubric_editor/toolbar/dropdown.dart';
import 'package:rubric/src/rubric_editor/toolbar/element_toolbar.dart';
import 'package:rubric/src/rubric_icon/icon_widget.dart';

class RubricBorderRadiusDropdown extends StatelessWidget {
  final double radius;
  final Function(double?) onChanged;
  const RubricBorderRadiusDropdown({
    super.key,
    required this.radius,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final style = RubricEditorStyle.of(context);

    return RubricToolbarDropdown(
      onUpdate: onChanged,
      items: [
        for (var value in BorderRadiusPresets.values)
          RubricDropdownMenuItem(
            value: value.radius,
            text: value.name,
          ),
      ],
      child: Row(
        spacing: RubricEditorStyle.paddingUnit * 0.5,
        children: [
          RubricIcon(
            Icons.check_box_outline_blank_outlined,
            size: ElementToolbarWidget.iconSize,
          ),
          RubricText("Corners"),
        ],
      ),
    );
  }
}
