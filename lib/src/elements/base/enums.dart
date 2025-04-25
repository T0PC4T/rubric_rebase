import 'package:flutter/material.dart';
import 'package:rubric/src/rubric_editor/models/style.dart';

abstract class AspectRatios {
  static const double oneToOne = 1;
  static const double fourThree = 4 / 3;
  static const double twoOne = 2 / 1;

  static String doubleToRatio(double ratio) {
    switch (ratio) {
      case oneToOne:
        return "1:1";
      case fourThree:
        return "4:3";
      case twoOne:
        return "2:1";
      default:
        return ratio.toString();
    }
  }

  static const values = [oneToOne, fourThree, twoOne];
}

abstract class ElementAlignment {
  static const left = "left";
  static const center = "center";
  static const right = "right";
  static const all = [left, center, right];
  static icon(String alignment) {
    return switch (alignment) {
      left => Icons.format_align_left_rounded,
      center => Icons.format_align_center_rounded,
      right => Icons.format_align_right_rounded,
      _ => Icons.error,
    };
  }

  static TextAlign textAlign(String alignment) {
    return switch (alignment) {
      left => TextAlign.left,
      center => TextAlign.center,
      right => TextAlign.right,
      _ => TextAlign.left,
    };
  }
}

enum ElementPadding {
  none("None", 0),
  small("Small", 10),
  medium("Medium", 20),
  large("Large", 50);

  final String display;
  final double value;
  const ElementPadding(this.display, this.value);
}

enum FixedWidths {
  full("Full Width", 1),
  fill("Fill Remaining", double.infinity),
  half("Half Width", .5),
  third("Third Width", .333),
  quarter("Quarter Width", .25);

  final String display;
  final double value;
  const FixedWidths(this.display, this.value);
}

enum FontSizes {
  small("Small", RubricEditorStyle.minimumFontSize - 5),
  medium("Medium", RubricEditorStyle.minimumFontSize),
  large("Large", RubricEditorStyle.minimumFontSize + 5),
  extraLarge("Extra Large", RubricEditorStyle.minimumFontSize + 15);

  final String display;
  final int value;
  const FontSizes(this.display, this.value);
}
