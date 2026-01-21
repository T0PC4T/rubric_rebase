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
    assert(
      _editorState != null,
      "Editor State not found, make sure you are using RubricEditorState.of(context) after the widget is mounted",
    );
    return _editorState!;
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(postFrame);
    super.initState();
  }

  void postFrame(_) {
    editorState;
  }

  bool get isFocused => editorState.edits.isFocused(element);

  onFocus(bool focused);

  @override
  void dispose() {
    _editorState?.edits.focusNotifier.removeParticularListener(onFocus);
    super.dispose();
  }
}
