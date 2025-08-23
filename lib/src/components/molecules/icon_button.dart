import 'package:flutter/material.dart';
import 'package:rubric/src/components/shared.dart';
import 'package:rubric/src/rubric_editor/models/style.dart';
import 'package:rubric/src/rubric_editor/toolbar/element_toolbar.dart';
import 'package:rubric/src/rubric_icon/icon_widget.dart';

enum RBStyles {
  light,
  theme,
  dark,
  alt,
}

class RubricIconButton extends StatelessWidget {
  final double size;
  final VoidCallback? onTap;
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
        (RBStyles.light, false) => rubricStyle.back,
        (RBStyles.theme, false) => rubricStyle.theme,
        (RBStyles.dark, false) => rubricStyle.fore,
        (RBStyles.alt, false) => rubricStyle.altBack,
        (RBStyles.light, true) => rubricStyle.fore9,
        (RBStyles.theme, true) => rubricStyle.fore7,
        (RBStyles.dark, true) => rubricStyle.fore,
        (RBStyles.alt, true) => rubricStyle.altBack,
      },
      hoverColor: switch ((style, disabled)) {
        (RBStyles.light, true) => rubricStyle.fore9,
        (RBStyles.theme, true) => rubricStyle.fore7,
        (RBStyles.dark, true) => rubricStyle.fore1,
        (RBStyles.alt, true) => rubricStyle.altBack,
        (RBStyles.dark, false) => rubricStyle.fore1,
        (RBStyles.light, false) => rubricStyle.fore95,
        (RBStyles.theme, false) => rubricStyle.theme2,
        (RBStyles.alt, false) => rubricStyle.alt5,
      },
      onTap: onTap,
      child: Stack(
        children: [
          Center(
            child: icon ??
                RubricIcon(
                  iconData,
                  color: switch ((disabled, isActive, style)) {
                    (true, _, _) => rubricStyle.fore4,
                    (_, true, RBStyles.dark || RBStyles.theme) =>
                      rubricStyle.theme,
                    (_, true, RBStyles.alt) => rubricStyle.alt5,
                    (_, true, RBStyles.light) => rubricStyle.theme,
                    (_, false, RBStyles.dark || RBStyles.theme) =>
                      rubricStyle.back,
                    (_, false, RBStyles.alt) => rubricStyle.altFore,
                    (_, false, RBStyles.light) => rubricStyle.fore,
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
            RubricIcon(
              iconData,
              color: isDark ? style.back : style.fore,
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
                border: Border.all(color: style.fore7, width: 1),
              ),
              width: ElementToolbarWidget.iconSize,
              height: ElementToolbarWidget.iconSize,
            ),
      ),
    );
  }
}
