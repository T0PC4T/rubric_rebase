import 'package:rubric/src/models/editor_models.dart';

enum ViewModes {
  desktop(GridSizes.pageSize),
  mobile(500);

  final double width;
  const ViewModes(this.width);
}
