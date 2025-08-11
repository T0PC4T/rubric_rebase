import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/models/elements.dart';

abstract class SelectableState<T extends StatefulWidget> extends State<T> {
  ElementModel get element;
  late RubricEditorState editorState;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(postFrame);
    super.initState();
  }

  postFrame(_) {
    editorState = RubricEditorState.of(context);
    editorState.edits.selectionNotifier.addListener(element.id, onSelect);
  }

  onSelect(bool selected);

  @override
  void dispose() {
    editorState.edits.selectionNotifier.removeListener(element.id);
    super.dispose();
  }
}

abstract class SelectableAndFocusableState<T extends StatefulWidget>
    extends State<T> {
  ElementModel get element;
  late RubricEditorState editorState;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(postFrame);
    super.initState();
  }

  postFrame(_) {
    editorState = RubricEditorState.of(context);
    editorState.edits.selectionNotifier.addListener(element.id, onSelect);
    editorState.edits.focusNotifier.addListener(element.id, onFocus);
  }

  bool get isSelected => editorState.edits.isSelected(element);
  bool get isFocused => editorState.edits.isFocused(element);

  onSelect(bool selected);
  onFocus(bool focused);

  @override
  void dispose() {
    editorState.edits.selectionNotifier.removeListener(element.id);
    editorState.edits.focusNotifier.removeListener(element.id);
    super.dispose();
  }
}
