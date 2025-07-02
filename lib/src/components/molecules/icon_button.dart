import 'package:flutter/material.dart';
import 'package:rubric/src/components/shared.dart';
import 'package:rubric/src/rubric_editor/models/style.dart';
import 'package:rubric/src/rubric_editor/toolbar/element_toolbar.dart';

class RubricIconButton extends StatelessWidget {
  final double size;
  final VoidCallback onTap;
  final IconData iconData;
  final bool isActive;
  final bool isDark;
  final bool disabled;
  final bool hasNotification;
  const RubricIconButton({
    super.key,
    required this.size,
    required this.onTap,
    required this.iconData,
    this.isActive = false,
    this.disabled = false,
    this.isDark = false,
    this.hasNotification = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = RubricEditorStyle.of(context);
    return RubricButton(
      width: size,
      height: size,
      backgroundColor: isDark ? style.dark : style.light,
      hoverColor: switch ((disabled, isActive, isDark)) {
        (true, _, true) => style.dark,
        (true, _, false) => style.light,
        (_, true, true) => style.dark,
        (_, true, false) => style.light,
        (_, false, true) => style.light2,
        (_, false, false) => style.light95,
      },
      onTap: onTap,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              iconData,
              color: switch ((disabled, isActive, isDark)) {
                (true, _, _) => style.light4,
                (_, true, true) => style.theme,
                (_, true, false) => style.theme,
                (_, false, true) => style.light,
                (_, false, false) => style.dark,
              },
              size: ElementToolbarWidget.iconSize,
            ),
          ),
          if (hasNotification)
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: style.danger,
              ),
            )
        ],
      ),
    );
  }
}

class RubricIconTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData iconData;
  final String text;
  final bool isSelected;
  final bool isDark;
  const RubricIconTextButton({
    super.key,
    required this.onTap,
    required this.iconData,
    required this.text,
    this.isSelected = false,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = RubricEditorStyle.of(context);
    return RubricButton.light(
      style,
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: RubricEditorStyle.paddingUnit * 0.5,
        ),
        child: Row(
          spacing: RubricEditorStyle.paddingUnit * 0.5,
          children: [
            Icon(
              iconData,
              color: isDark ? style.light : style.dark,
              size: ElementToolbarWidget.iconSize,
            ),
            RubricText(text),
          ],
        ),
      ),
    );
  }
}

class RubricColorButton extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;
  const RubricColorButton({
    super.key,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final style = RubricEditorStyle.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: style.light7, width: 1),
        ),
        width: ElementToolbarWidget.iconSize,
        height: ElementToolbarWidget.iconSize,
      ),
    );
  }
}
