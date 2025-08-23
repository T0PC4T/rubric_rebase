// ignore_for_file: public_member_api_docs, sort_constructors_first
// constant variables such as primary color, borderRadius

import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';

class RubricEditorStyle {
  static const paddingUnit = 10.0;
  static const minimumFontSize = 18;
  static const headerFontSize = 25;

  final String logoUrl;
  final double radius;
  final double fontSize;
  final FontWeight fontWeight;
  final double elevation;
  // final Color theme;
  final Color theme;
  final Color fore;
  final Color back;
  final Color altBack;
  final Color altFore;

  final Color danger;

  final List<Color> brandColors;

  const RubricEditorStyle(
      {this.logoUrl = "assets/logo.png",
      this.radius = 8,
      this.fontSize = 14,
      this.fontWeight = FontWeight.w500,
      this.elevation = 6,
      this.theme = const Color.fromARGB(255, 0, 162, 255),
      this.fore = const Color.fromARGB(255, 0, 0, 0),
      this.back = const Color.fromARGB(255, 255, 255, 255),
      this.altBack = const Color.fromARGB(255, 0, 0, 0),
      this.altFore = const Color.fromARGB(255, 255, 255, 255),
      this.brandColors = const [
        // Grey Shades
        Color.fromARGB(255, 255, 255, 255), // Light Grey
        Color.fromARGB(255, 195, 195, 195), // Medium Grey
        Color.fromARGB(255, 84, 86, 87), // Dark Grey
        Color.fromARGB(255, 0, 0, 0),
        // Primary Blue
        Color.fromARGB(255, 0, 162, 255),

        // Secondary Teal
        Color.fromARGB(255, 57, 210, 192),

        // Tertiary Coral
        Color.fromARGB(255, 238, 139, 96),
      ],
      this.danger = Colors.red});

  // Danger color lerp
  Color get danger4 => Color.lerp(danger, back, 0.4)!;
  Color get danger8 => Color.lerp(danger, back, 0.8)!;

  Color get theme8 => Color.lerp(theme, back, 0.8)!;
  Color get theme7 => Color.lerp(theme, back, 0.7)!;
  Color get theme4 => Color.lerp(theme, back, 0.4)!; // for theme hover
  Color get theme2 => Color.lerp(theme, back, 0.2)!; // for theme hover
  Color get themeDark4 => Color.lerp(theme, fore, 0.4)!; // for theme hover
  Color get themeDark8 => Color.lerp(theme, fore, 0.8)!; // for theme hover

  Color get fore1 => Color.lerp(fore, back, 0.1)!;
  Color get fore2 => Color.lerp(fore, back, 0.2)!;
  Color get fore4 => Color.lerp(fore, back, 0.4)!; // borders darker
  Color get fore7 => Color.lerp(fore, back, 0.7)!; // borders
  Color get fore8 => Color.lerp(fore, back, 0.8)!; // light hoverover
  Color get fore9 => Color.lerp(fore, back, 0.9)!; // light hoverover
  Color get fore95 => Color.lerp(fore, back, 0.95)!;
  Color get fore98 => Color.lerp(fore, back, 0.98)!;

  Color get alt5 => Color.lerp(altBack, altFore, 0.5)!;

  static double get paddingNum => paddingUnit;
  static double get halfPaddingNum => paddingUnit * 0.5;
  static EdgeInsets get padding => EdgeInsets.all(paddingUnit);
  static EdgeInsets get halfPadding => EdgeInsets.all(halfPaddingNum);
  EdgeInsets get paddingInsets => padding;
  BorderRadius get borderRadius => BorderRadius.circular(radius);

  static RubricEditorStyle of(BuildContext context) {
    final result = RubricEditorState.of(context).widget.style;
    return result;
  }
}
