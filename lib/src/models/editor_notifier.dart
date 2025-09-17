import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:rubric/src/models/canvas.dart';
import 'package:rubric/src/models/editor_models.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/models/selection_notifiers.dart';
import 'package:rubric/src/rubric_editor/models/preview.dart';

class ElementNotifier extends ValueNotifier<ElementModel?> {
  ElementNotifier(super.value);
}

class EditorNotifier extends ValueNotifier<CanvasEditingModel> {
  final focusNotifier = FocusNotifier();

  EditorNotifier(super.value);

  @override
  void dispose() {
    focusNotifier.dispose();
    super.dispose();
  }

  void focusElement([ElementModel? element]) {
    value = value.copyWith(focused: element);
    focusNotifier.focus = element;
    notifyListeners();
  }

  void setPreview(bool preview) {
    value = value.copyWith(focused: value.focused, previewing: preview);
  }

  void changeViewMode(ViewModes newValue) {
    value = value.copyWith(focused: value.focused, viewMode: newValue);
  }

  bool isFocused(ElementModel element) {
    return value.focused?.id == element.id;
  }

  double scrollOffset = 0;
  void setScrollOffset(double newOffset) {
    scrollOffset = newOffset;
  }

  static const int maxSteps = 5;
  void saveStep(CanvasModel step) {
    List<CanvasModel> steps;
    if (value.undoIndex != value.steps.length) {
      // we have started to use unto so we need to burn the tree forward.
      steps = [...value.steps.sublist(0, value.undoIndex + 1), step];
    } else {
      steps = [
        ...value.steps.sublist(0, math.min(value.steps.length, 3)),
        step,
      ];
    }
    if (steps.length > maxSteps) {
      steps = steps.sublist(steps.length - maxSteps);
    }
    value = value.copyWith(
      focused: value.focused,
      steps: steps,
      undoIndex: steps.length - 1,
    );
  }

  CanvasModel get currentUndo => value.steps[value.undoIndex];
  bool get canUndo => value.undoIndex > 0;
  bool get canRedo => value.undoIndex < value.steps.length - 1;

  CanvasModel redo() {
    value = value.copyWith(focused: null, undoIndex: value.undoIndex + 1);

    return value.steps[value.undoIndex];
  }

  CanvasModel undo() {
    value = value.copyWith(focused: null, undoIndex: value.undoIndex - 1);

    return value.steps[value.undoIndex];
  }

  CanvasModel get lastStep => value.steps[value.undoIndex];
}
