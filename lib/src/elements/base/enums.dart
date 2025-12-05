import 'package:flutter/material.dart';
import 'package:rubric/src/rubric_editor/models/style.dart';

abstract class AspectRatios {
  static const double square = 1;
  static const double widescreen = 16 / 9;
  static const double ultraWide = 21 / 9;
  static const double portrait = 2 / 3;

  static String doubleToRatio(double ratio) {
    switch (ratio) {
      case square:
        return "Square (1:1)";
      case widescreen:
        return "Widescreen (16:9)";
      case ultraWide:
        return "Ultra Wide (21:9)";
      case portrait:
        return "Portrait (2:3)";
      default:
        return ratio.toString();
    }
  }

  static const values = [square, widescreen, ultraWide, portrait];
}

abstract class ElementAlignment {
  static const left = "left";
  static const center = "center";
  static const right = "right";
  static const all = [left, center, right];
  static IconData icon(String alignment) {
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
  full("Full Width", "⅟", 1),
  threequarters("Three Quarters", "¾", .75),
  half("Half Width", "½", .5),
  quarter("Quarter Width", "¼", .25);

  final String display;
  final String icon;
  final double value;
  const FixedWidths(this.display, this.icon, this.value);
}

enum FontSizes {
  small("Small", RubricEditorStyle.minimumFontSize - 5),
  medium("Medium", RubricEditorStyle.minimumFontSize),
  large("Large", RubricEditorStyle.minimumFontSize + 5);

  final String display;
  final int value;
  const FontSizes(this.display, this.value);
}

enum HeadingFontSizes {
  h1("Heading 1", RubricEditorStyle.minimumFontSize + 25),
  h2("Heading 2", RubricEditorStyle.minimumFontSize + 15),
  h3("Heading 3", RubricEditorStyle.minimumFontSize + 10);

  final String display;
  final int value;
  const HeadingFontSizes(this.display, this.value);
}

abstract class RowCrossAxisAlignment {
  static const start = "start";
  static const center = "center";
  static const end = "end";

  static const all = [start, center, end];

  static CrossAxisAlignment toCrossAxisAlignment(String alignment) {
    return switch (alignment) {
      start => CrossAxisAlignment.start,
      center => CrossAxisAlignment.center,
      end => CrossAxisAlignment.end,

      _ => CrossAxisAlignment.start,
    };
  }

  static IconData toIcon(String alignment) {
    return switch (alignment) {
      start => Icons.align_vertical_top_rounded,
      center => Icons.align_vertical_center_rounded,
      end => Icons.align_vertical_bottom_rounded,

      _ => Icons.align_vertical_top_rounded,
    };
  }

  static String toDisplayName(String alignment) {
    return switch (alignment) {
      start => "Start",
      center => "Center",
      end => "End",

      _ => "Start",
    };
  }
}
