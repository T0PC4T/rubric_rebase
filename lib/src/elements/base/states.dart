import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/models/elements.dart';

abstract class FocusableState<T extends StatefulWidget> extends State<T> {
  ElementModel get element;
  RubricEditorState? _editorState;
  RubricEditorState get editorState {
    if (mounted && _editorState == null) {
      _editorState = RubricEditorState.of(context);
      _editorState!.edits.focusNotifier.addListener(element.id, onFocus);
    }
    return _editorState!;
  }

  bool get isFocused => editorState.edits.isFocused(element);

  onFocus(bool focused);

  @override
  void dispose() {
    _editorState?.edits.focusNotifier.removeListener(element.id);
    super.dispose();
  }
}
