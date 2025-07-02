import 'package:flutter/material.dart';
import 'package:rubric/src/rubric_editor/models/style.dart';

class RubricButton extends StatefulWidget {
  // Styles
  final Color backgroundColor;
  final Color hoverColor;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? radius;
  final Color? borderColor;
  final double? borderWidth;
  final Alignment alignment;
  // Core
  final VoidCallback onTap;
  final Widget child;
  const RubricButton({
    super.key,
    required this.backgroundColor,
    required this.hoverColor,
    required this.child,
    this.width,
    this.height,
    this.radius,
    required this.onTap,
    this.padding,
    this.margin,
    this.borderColor,
    this.borderWidth,
    this.alignment = Alignment.center,
  });

  factory RubricButton.light(
    RubricEditorStyle style, {
    required VoidCallback onTap,
    required Widget child,
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? radius,
    Color? borderColor,
    double? borderWidth,
  }) {
    return RubricButton(
      backgroundColor: style.light,
      hoverColor: style.light95,
      onTap: onTap,
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      radius: radius,
      borderColor: borderColor,
      borderWidth: borderWidth,
      child: child,
    );
  }

  factory RubricButton.dark(
    RubricEditorStyle style, {
    required VoidCallback onTap,
    required Widget child,
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? radius,
    Color? borderColor,
    double? borderWidth,
  }) {
    return RubricButton(
      backgroundColor: style.dark,
      hoverColor: style.theme,
      onTap: onTap,
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      radius: radius,
      borderColor: borderColor,
      borderWidth: borderWidth,
      child: child,
    );
  }

  factory RubricButton.theme(
    RubricEditorStyle style, {
    required VoidCallback onTap,
    required Widget child,
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? radius,
    Color? borderColor,
    double? borderWidth,
  }) {
    return RubricButton(
      backgroundColor: style.theme,
      hoverColor: style.theme4,
      onTap: onTap,
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      radius: radius,
      borderColor: borderColor,
      borderWidth: borderWidth,
      child: child,
    );
  }

  @override
  State<RubricButton> createState() => RubricButtonState();
}

class RubricButtonState extends State<RubricButton> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final styles = RubricEditorStyle.of(context);

    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) {
          setState(() {
            hovered = true;
          });
        },
        onExit: (event) {
          setState(() {
            hovered = false;
          });
        },
        child: Container(
          margin: widget.margin,
          alignment: widget.alignment,
          padding: widget.padding,
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: hovered ? widget.hoverColor : widget.backgroundColor,
            borderRadius: BorderRadius.circular(widget.radius ?? 0),
            border: widget.borderWidth == null
                ? null
                : Border.all(
                    color: widget.borderColor ?? styles.light7,
                    width: widget.borderWidth!,
                  ),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
