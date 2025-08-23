import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/elements/base/states.dart';
import 'package:rubric/src/elements/row/row_model.dart';
import 'package:rubric/src/elements/row/row_toolbar.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/viewer/items/handler.dart';

class RowEditorElement extends StatefulWidget {
  final ElementModel element;
  const RowEditorElement({super.key, required this.element});

  @override
  State<RowEditorElement> createState() => RowEditorElementState();
}

class RowEditorElementState extends FocusableState<RowEditorElement> {
  @override
  onFocus(bool focused) {
    if (focused) {
      editorState.showToolbar(
        widget.element,
        RowTooltipWidget(element: widget.element),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final editor = RubricEditorState.of(context);
    final rowElement = editor.canvas.getElement(widget.element.id);
    final properties = rowElement.getProperties<RowElementModel>();
    final columns = properties.elements;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          for (var i = 0; i < columns.length; i++)
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (columns[i].isEmpty)
                    EditorEmptyInserterWidget(
                        parent: element, id: i.toString()),
                  for (var item in columns[i])
                    EditorElementWidget(
                      element: ElementModel.fromMap(item),
                      parent: element,
                    ),
                ],
              ),
            )
        ],
      ),
    );
  }

  @override
  ElementModel get element => widget.element;
}

class RowReaderElement extends StatelessWidget {
  final ElementModel element;
  const RowReaderElement({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    final rowElement = element.getProperties<RowElementModel>();
    final columns = rowElement.elements;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          for (var column in columns)
            Expanded(
              child: Column(
                children: [
                  for (var element in column)
                    ReaderElementWidget(
                      element: ElementModel.fromMap(element),
                    ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
