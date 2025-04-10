import 'package:rubric/src/models/editor_models.dart';

enum ViewModes {
  desktop(GridSizes.pageSize),
  mobile(600);

  final double width;
  const ViewModes(this.width);

  factory ViewModes.fromWidth(double width) {
    if (width < GridSizes.pageSize) {
      return ViewModes.mobile;
    } else {
      return ViewModes.desktop;
    }
  }
}
