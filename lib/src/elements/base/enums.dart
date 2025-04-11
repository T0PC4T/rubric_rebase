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
  full("Full", 1),
  half("1/2", .5),
  third("1/3", .333),
  quarter("1/4", .25);

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
