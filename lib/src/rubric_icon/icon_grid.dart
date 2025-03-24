import 'package:flutter/material.dart';
import 'package:rubric/src/rubric_icon/icons.dart';

class RubricIconGrid extends StatefulWidget {
  static int iconsAcross = 4;
  static int iconsDown = 4;
  final Function(String iconName) onSelect;
  final String currentIcon;
  final Color iconColor;
  final Color iconSelectedColor;
  final Color buttonColor;
  final Color hoverColor;
  final double borderRadius;
  final double marginNum;

  const RubricIconGrid({
    super.key,
    required this.onSelect,
    required this.currentIcon,
    required this.iconColor,
    required this.iconSelectedColor,
    required this.buttonColor,
    required this.hoverColor,
    required this.borderRadius,
    required this.marginNum,
  });

  @override
  State<RubricIconGrid> createState() => _RubricIconGridState();
}

class _RubricIconGridState extends State<RubricIconGrid> {
  String? hovered;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: RubricIconGrid.iconsAcross,
      crossAxisSpacing: widget.marginNum,
      mainAxisSpacing: widget.marginNum,
      children: [
        for (var iconName in allIcons.entries)
          GestureDetector(
            onTap: () {
              widget.onSelect(iconName.key);
            },
            child: MouseRegion(
              onEnter: (event) {
                setState(() {
                  hovered = iconName.key;
                });
              },
              onExit: (event) {
                setState(() {
                  hovered = null;
                });
              },
              child: Container(
                padding: EdgeInsets.all(widget.marginNum * 2),
                decoration: BoxDecoration(
                  color: hovered == iconName.key
                      ? widget.hoverColor
                      : widget.buttonColor,
                  border: Border.all(
                      color: widget.currentIcon != iconName.key
                          ? widget.iconColor
                          : widget.iconSelectedColor,
                      width: 1),
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Icon(
                    iconName.value,
                    color: widget.currentIcon != iconName.key
                        ? widget.iconColor
                        : widget.iconSelectedColor,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
