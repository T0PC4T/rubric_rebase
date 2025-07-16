import 'package:flutter/material.dart';
import 'package:rubric/src/components/shared.dart';
import 'package:rubric/src/rubric_editor/models/style.dart';
import 'package:rubric/src/rubric_editor/toolbar/element_toolbar.dart';

enum RBStyles {
  light,
  theme,
  dark,
}

class RubricIconButton extends StatelessWidget {
  final double size;
  final VoidCallback onTap;
  final IconData iconData;
  final Widget? icon;
  final bool isActive;
  final RBStyles style;
  final bool disabled;
  final bool hasNotification;
  final double? iconSize;
  const RubricIconButton(
      {super.key,
      required this.size,
      required this.onTap,
      this.iconData = const IconData(0xf04b6, fontFamily: 'MaterialIcons'),
      this.isActive = false,
      this.disabled = false,
      this.style = RBStyles.light,
      this.hasNotification = false,
      this.icon,
      this.iconSize});

  @override
  Widget build(BuildContext context) {
    final rubricStyle = RubricEditorStyle.of(context);
    return RubricButton(
      width: size,
      height: size,
      backgroundColor: switch ((style, disabled)) {
        (RBStyles.light, false) => rubricStyle.light,
        (RBStyles.theme, false) => rubricStyle.theme,
        (RBStyles.dark, false) => rubricStyle.dark,
        (RBStyles.light, true) => rubricStyle.light9,
        (RBStyles.theme, true) => rubricStyle.light7,
        (RBStyles.dark, true) => rubricStyle.dark,
      },
      hoverColor: switch ((style, disabled)) {
        (RBStyles.light, true) => rubricStyle.light9,
        (RBStyles.theme, true) => rubricStyle.light7,
        (RBStyles.dark, true) => rubricStyle.light1,
        (RBStyles.dark, false) => rubricStyle.light1,
        (RBStyles.light, false) => rubricStyle.light95,
        (RBStyles.theme, false) => rubricStyle.theme2,
      },
      onTap: onTap,
      child: Stack(
        children: [
          Center(
            child: icon ??
                Icon(
                  iconData,
                  color: switch ((disabled, isActive, style)) {
                    (true, _, _) => rubricStyle.light4,
                    (_, true, RBStyles.dark || RBStyles.theme) =>
                      rubricStyle.theme,
                    (_, true, RBStyles.light) => rubricStyle.theme,
                    (_, false, RBStyles.dark || RBStyles.theme) =>
                      rubricStyle.light,
                    (_, false, RBStyles.light) => rubricStyle.dark,
                  },
                  size: iconSize ?? ElementToolbarWidget.iconSize,
                ),
          ),
          if (hasNotification)
            Align(
              alignment: Alignment(.65, -.65),
              child: Container(
                margin: EdgeInsets.only(top: 2, right: 2),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: rubricStyle.danger,
                ),
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
  final Widget Function(Color color)? builder;
  const RubricColorButton({
    super.key,
    required this.color,
    required this.onTap,
    this.builder,
  });

  @override
  Widget build(BuildContext context) {
    final style = RubricEditorStyle.of(context);

    return GestureDetector(
      onTap: onTap,
      child: FittedBox(
        child: builder?.call(color) ??
            Container(
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(color: style.light7, width: 1),
              ),
              width: ElementToolbarWidget.iconSize,
              height: ElementToolbarWidget.iconSize,
            ),
      ),
    );
  }
}
