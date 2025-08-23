import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/models/elements.dart';

abstract class FocusableState<T extends StatefulWidget> extends State<T> {
  ElementModel get element;
  late RubricEditorState editorState;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(postFrame);
    super.initState();
  }

  postFrame(_) {
    if (mounted) {
      editorState = RubricEditorState.of(context);

      editorState.edits.focusNotifier.addListener(element.id, onFocus);
    }
  }

  bool get isFocused => editorState.edits.isFocused(element);

  onFocus(bool focused);

  @override
  void dispose() {
    editorState.edits.focusNotifier.removeListener(element.id);
    super.dispose();
  }
}
