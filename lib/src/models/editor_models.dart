// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:rubric/src/elements/elements.dart';
import 'package:rubric/src/models/canvas.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/models/preview.dart';

/*
These models are dedicated to the editor state. This state does not affect the actual lesson being built but only the current users editing view.
 */
enum GridSizes {
  none("None", 0),
  small("Small", 10),
  medium("Medium", 20),
  large("Large", 30);

  static bool isMobile(double screenWidth) {
    return screenWidth < pageSize;
  }

  static const double pageSize = 1000;

  double get pixelsPerLock => 10;
  final double spacing;
  final String pretty;

  const GridSizes(this.pretty, this.spacing);

  // from name
  static GridSizes fromName(String name) {
    return switch (name) {
      'none' => GridSizes.none,
      'small' => GridSizes.small,
      'medium' => GridSizes.medium,
      'large' => GridSizes.large,
      _ => throw Exception('Unknown grid size: name'),
    };
  }
}

class CanvasEditingModel {
  final ElementModel? focused;
  final ElementType? dragging;
  final List<CanvasModel> steps;
  final int undoIndex;
  final bool showGrid;
  final bool previewing;
  final ViewModes viewMode;

  CanvasEditingModel({
    this.focused,
    this.dragging,
    required this.steps,
    this.undoIndex = 0,
    this.showGrid = false,
    this.previewing = false,
    this.viewMode = ViewModes.desktop,
  });

  CanvasEditingModel copyWith({
    required ElementModel? focused,
    ElementType? dragging,
    bool? previewing,
    ViewModes? viewMode,
    List<CanvasModel>? steps,
    int? undoIndex,
    GridSizes? gridSize,
    bool? showGrid,
  }) {
    return CanvasEditingModel(
      previewing: previewing ?? this.previewing,
      viewMode: viewMode ?? this.viewMode,
      focused: focused,
      dragging: dragging,
      steps: steps ?? this.steps,
      undoIndex: undoIndex ?? this.undoIndex,
      showGrid: showGrid ?? this.showGrid,
    );
  }

  @override
  bool operator ==(covariant CanvasEditingModel other) {
    if (identical(this, other)) return true;

    return other.focused == focused &&
        other.dragging == dragging &&
        listEquals(other.steps, steps) &&
        other.undoIndex == undoIndex &&
        other.showGrid == showGrid &&
        other.previewing == previewing &&
        other.viewMode == viewMode;
  }

  @override
  int get hashCode {
    return focused.hashCode ^
        dragging.hashCode ^
        steps.hashCode ^
        undoIndex.hashCode ^
        showGrid.hashCode ^
        previewing.hashCode ^
        viewMode.hashCode;
  }
}
