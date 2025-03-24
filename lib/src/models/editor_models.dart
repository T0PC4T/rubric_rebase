// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:rubric/src/elements/elements.dart';
import 'package:rubric/src/models/canvas.dart';
import 'package:rubric/src/models/elements.dart';

/*
These models are dedicated to the editor state. This state does not affect the actual lesson being built but only the current users editing view.
 */
enum GridSizes {
  none("None", 0),
  small("Small", 20),
  medium("Medium", 40),
  large("Large", 80);

  static const double pageSize = 720;
  static const double padding = 40;
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
  final ElementTypes? holding;
  final ElementModel? selected;
  final ElementModel? focused;
  final List<CanvasModel> steps;
  final int undoIndex;
  final bool showGrid;
  CanvasEditingModel({
    this.holding,
    this.selected,
    this.focused,
    required this.steps,
    this.undoIndex = 0,
    this.showGrid = false,
  });

  CanvasEditingModel copyWith({
    required ElementModel? selected,
    required ElementModel? focused,
    ElementTypes? holding,
    List<CanvasModel>? steps,
    int? undoIndex,
    GridSizes? gridSize,
    bool? showGrid,
  }) {
    return CanvasEditingModel(
      selected: selected,
      focused: focused,
      holding: holding,
      steps: steps ?? this.steps,
      undoIndex: undoIndex ?? this.undoIndex,
      showGrid: showGrid ?? this.showGrid,
    );
  }

  @override
  String toString() {
    return 'CanvasEditingModel(holding: $holding, selected: $selected, focused: $focused, steps: $steps, undoIndex: $undoIndex, showGrid: $showGrid)';
  }

  @override
  bool operator ==(covariant CanvasEditingModel other) {
    if (identical(this, other)) return true;

    return other.holding == holding &&
        other.selected == selected &&
        other.focused == focused &&
        listEquals(other.steps, steps) &&
        other.undoIndex == undoIndex &&
        other.showGrid == showGrid;
  }

  @override
  int get hashCode {
    return holding.hashCode ^
        selected.hashCode ^
        focused.hashCode ^
        steps.hashCode ^
        undoIndex.hashCode ^
        showGrid.hashCode;
  }
}
