import 'package:rubric/src/rubric_editor/models/style.dart';

enum AspectRatios {
  oneToOne("1:1", 1),
  fourThree("4:3", 4 / 3),
  twoOne("2:1", 2 / 1);

  final String display;
  final double value;
  const AspectRatios(this.display, this.value);
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
