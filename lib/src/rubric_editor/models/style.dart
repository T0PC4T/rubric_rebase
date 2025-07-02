// ignore_for_file: public_member_api_docs, sort_constructors_first
// constant variables such as primary color, borderRadius

import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';

class RubricEditorStyle {
  static const paddingUnit = 10.0;
  static const minimumFontSize = 18;

  final String logoUrl;
  final double radius;
  final double fontSize;
  final FontWeight fontWeight;
  final double elevation;
  final Color theme;
  final Color dark;
  final Color light;
  final Color danger;
  final Color borderColor;
  final List<Color> brandColors;

  const RubricEditorStyle({
    this.logoUrl = "assets/logo.png",
    this.radius = 8,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w500,
    this.elevation = 6,
    this.brandColors = const [
      // Grey Shades
      Color.fromARGB(255, 233, 236, 239), // Light Grey
      Color.fromARGB(255, 108, 117, 125), // Medium Grey
      Color.fromARGB(255, 52, 58, 64), // Dark Grey
      Color.fromARGB(255, 0, 0, 0),
      // Primary Blue
      Color.fromARGB(255, 0, 149, 255),

      // Secondary Teal
      Color.fromARGB(255, 57, 210, 192),

      // Tertiary Coral
      Color.fromARGB(255, 238, 139, 96),
    ],
    this.theme = const Color.fromARGB(
      255,
      0,
      162,
      255,
    ), // color picker text should be black
    this.dark = const Color.fromARGB(255, 0, 0, 0),
    this.light = const Color.fromARGB(255, 255, 255, 255),
    this.danger = Colors.red,
    this.borderColor = const Color.fromARGB(255, 212, 212, 212),
  });

  Color get theme8 => Color.lerp(theme, light, 0.8)!;
  Color get theme7 => Color.lerp(theme, light, 0.7)!;
  Color get theme4 => Color.lerp(theme, light, 0.4)!; // for theme hover
  Color get theme2 => Color.lerp(theme, light, 0.2)!; // for theme hover
  Color get themeDark4 => Color.lerp(theme, dark, 0.4)!; // for theme hover
  Color get themeDark8 => Color.lerp(theme, dark, 0.8)!; // for theme hover

  Color get light1 => Color.lerp(dark, light, 0.1)!;
  Color get light2 => Color.lerp(dark, light, 0.2)!;
  Color get light4 => Color.lerp(dark, light, 0.4)!; // borders darker
  Color get light7 => Color.lerp(dark, light, 0.7)!; // borders
  Color get light9 => Color.lerp(dark, light, 0.9)!; // light hoverover
  Color get light95 => Color.lerp(dark, light, 0.95)!;
  Color get light98 => Color.lerp(dark, light, 0.98)!;

  static double get paddingNum => paddingUnit;
  static double get halfPaddingNum => paddingUnit * 0.5;
  static EdgeInsets get padding => EdgeInsets.all(paddingUnit);
  static EdgeInsets get halfPadding => EdgeInsets.all(halfPaddingNum);
  BorderRadius get borderRadius => BorderRadius.circular(radius);

  static RubricEditorStyle of(BuildContext context) {
    final result = RubricEditorState.of(context).widget.style;
    return result;
  }
}
