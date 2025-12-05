import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/elements/base/enums.dart';
import 'package:rubric/src/elements/base/states.dart';
import 'package:rubric/src/elements/row/row_model.dart';
import 'package:rubric/src/elements/row/row_toolbar.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/models/preview.dart';
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
          widget.element, (element) => RowTooltipWidget(element: element));
    }
  }

  @override
  Widget build(BuildContext context) {
    final editor = RubricEditorState.of(context);
    final canvas = editor.canvas.value;
    final rowElement = editor.canvas.getElement(widget.element.id);
    final properties = rowElement.getProperties<RowElementModel>();
    final columns = properties.elements;

    return Container(
      color: properties.color,
      margin: EdgeInsets.symmetric(
          vertical: properties.color == Colors.transparent
              ? 0
              : canvas.settings.spacing / 2),
      padding: EdgeInsets.symmetric(
        horizontal: properties.color == Colors.transparent
            ? 0
            : canvas.settings.spacing,
        vertical: properties.color == Colors.transparent
            ? 0
            : canvas.settings.spacing / 2,
      ),
      child: Row(
        crossAxisAlignment:
            RowCrossAxisAlignment.toCrossAxisAlignment(properties.crossAxisAlignment),
        spacing: editor.canvas.value.settings.spacing,
        children: [
          for (var i = 0; i < columns.length; i++)
            Expanded(
              child: Column(
                spacing: editor.canvas.value.settings.spacing,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (columns[i].isEmpty)
                    EditorEmptyInserterWidget(parent: element, id: i.toString()),
                  for (var item in columns[i])
                    EditorElementWidget(
                        element: ElementModel.fromMap(item), parent: element),
                ],
              ),
            ),
        ],
      ),
    );
  }

  @override
  ElementModel get element => widget.element;
}

class RowReaderElement extends StatelessWidget {
  final ElementModel element;
  final CanvasModel canvas;
  const RowReaderElement(
      {super.key, required this.element, required this.canvas});

  @override
  Widget build(BuildContext context) {
    final properties = element.getProperties<RowElementModel>();
    final columns = properties.elements;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          color: properties.color,
          margin: EdgeInsets.symmetric(
            vertical: properties.color == Colors.transparent
                ? 0
                : canvas.settings.spacing / 2,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: properties.color == Colors.transparent
                ? 0
                : canvas.settings.spacing,
            vertical: properties.color == Colors.transparent
                ? 0
                : canvas.settings.spacing / 2,
          ),
          child: Flex(
            spacing: canvas.settings.spacing,
            direction: constraints.maxWidth <= ViewModes.mobile.width + 100
                ? Axis.vertical
                : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: RowCrossAxisAlignment.toCrossAxisAlignment(
                properties.crossAxisAlignment),
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var column in columns)
                Flexible(
                  child: Column(
                    // spacing: canvas.settings.spacing,
                    children: [
                      for (var element in column)
                        ReaderElementWidget(
                            canvas: canvas,
                            element: ElementModel.fromMap(element)),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
