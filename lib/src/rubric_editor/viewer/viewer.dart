import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/models/editor_models.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/sidebar/sidebar.dart';
import 'package:rubric/src/rubric_editor/viewer/items/handler.dart';

class RubricEditorViewer extends StatefulWidget {
  const RubricEditorViewer({super.key});

  @override
  State<RubricEditorViewer> createState() => RubricEditorViewerState();
}

class RubricEditorViewerState extends State<RubricEditorViewer> {
  ElementModel? scaling;

  late ScrollController _scrollController;
  late RubricEditorState editorState;
  late CanvasModel canvas;
  late CanvasEditingModel edits;

  void _refreshHandler() {
    setState(() {});
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      editorState.registerScrollController(_scrollController);
      editorState.canvas.addListener(_refreshHandler);
      editorState.edits.addListener(_refreshHandler);
    });
    super.initState();
  }

  @override
  void dispose() {
    editorState.canvas.removeListener(_refreshHandler);
    editorState.edits.removeListener(_refreshHandler);

    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    editorState = RubricEditorState.of(context);
    canvas = editorState.canvas.value;
    edits = editorState.edits.value;
    return ColoredBox(
      color: canvas.settings.canvasColor,
      child: GestureDetector(
        onTap: () {
          setState(() {
            editorState.edits.focusElement();
          });
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            final viewMode = editorState.edits.value.viewMode;

            return Listener(
              onPointerMove: (event) {
                if (event.localPosition.dy < 100) {
                  _scrollController.jumpTo(max(_scrollController.offset - 10, 0));
                }
                if (event.localPosition.dy > constraints.maxHeight - 100) {
                  _scrollController.jumpTo(
                    min(_scrollController.offset + 10, _scrollController.position.maxScrollExtent),
                  );
                }
              },
              child: ListView.builder(
                itemCount: canvas.elements.length + 1,
                shrinkWrap: true,
                addAutomaticKeepAlives: false,
                addRepaintBoundaries: false,
                addSemanticIndexes: false,
                controller: _scrollController,
                padding: EdgeInsets.symmetric(
                  vertical: max(sidebarButtonHeight, canvas.settings.spacing / 2),
                  horizontal: (constraints.maxWidth - viewMode.width) / 2 + canvas.settings.spacing / 2,
                ),
                itemBuilder: (context, index) {
                  if (index == canvas.elements.length) {
                    return EditorEmptyInserterWidget();
                  }
                  return EditorElementWidget(element: canvas.elements[index]);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

abstract class PaintIndexes {
  static const int back = -1;
  static const int front = 1000;
  static const int behindFront = 999;
}
