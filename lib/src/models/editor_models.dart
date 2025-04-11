// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:rubric/src/models/canvas.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/models/preview.dart';

/*
These models are dedicated to the editor state. This state does not affect the actual lesson being built but only the current users editing view.
 */
enum GridSizes {
  none("None", 0),
  small("Small", 25),
  medium("Medium", 50),
  large("Large", 100);

  static bool isMobile(double screenWidth) {
    return screenWidth < pageSize;
  }

  static const double pageSize = 1000;
  static const double padding = 25;
  double get pixelsPerLock => 10;
  final double pixelsPerLine;
  final String pretty;

  const GridSizes(this.pretty, this.pixelsPerLine);

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
  final ElementModel? selected;
  final ElementModel? focused;
  final List<CanvasModel> steps;
  final int undoIndex;
  final bool showGrid;
  final bool previewing;
  final ViewModes viewMode;

  CanvasEditingModel({
    this.selected,
    this.focused,
    required this.steps,
    this.undoIndex = 0,
    this.showGrid = false,
    this.previewing = false,
    this.viewMode = ViewModes.desktop,
  });

  CanvasEditingModel copyWith({
    required ElementModel? selected,
    required ElementModel? focused,
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
      selected: selected,
      focused: focused,
      steps: steps ?? this.steps,
      undoIndex: undoIndex ?? this.undoIndex,
      showGrid: showGrid ?? this.showGrid,
    );
  }

  @override
  String toString() {
    return 'CanvasEditingModel(selected: $selected, focused: $focused, steps: $steps, undoIndex: $undoIndex, showGrid: $showGrid, previewing: $previewing, viewMode: $viewMode)';
  }

  @override
  bool operator ==(covariant CanvasEditingModel other) {
    if (identical(this, other)) return true;

    return other.selected == selected &&
        other.focused == focused &&
        listEquals(other.steps, steps) &&
        other.undoIndex == undoIndex &&
        other.showGrid == showGrid &&
        other.previewing == previewing &&
        other.viewMode == viewMode;
  }

  @override
  int get hashCode {
    return selected.hashCode ^
        focused.hashCode ^
        steps.hashCode ^
        undoIndex.hashCode ^
        showGrid.hashCode ^
        previewing.hashCode ^
        viewMode.hashCode;
  }
}
