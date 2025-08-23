import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/elements/row/row_model.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/toolbar/element_toolbar.dart';

class RowTooltipWidget extends StatelessWidget {
  final ElementModel element;
  const RowTooltipWidget({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    final editorState = RubricEditorState.of(context);
    final style = editorState.style;
    return ValueListenableBuilder(
      valueListenable: editorState.canvas,
      builder: (context, canvas, _) {
        final newElement = editorState.canvas.getElement(element.id);
        final properties = newElement.getProperties<RowElementModel>();
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ToolbarUniversalIcons(
              element: element,
            ),
          ],
        );
      },
    );
  }
}
