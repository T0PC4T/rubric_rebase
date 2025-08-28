import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/components/atoms/text.dart';
import 'package:rubric/src/elements/row/row_model.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/toolbar/dropdown.dart';
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
            SizedBox(
              width: style.radius,
            ),
            RubricToolbarDropdown<int>(
              onUpdate: (value) {
                if (value case int newValue) {
                  final newColumns = <List<Map<String, dynamic>>>[
                    for (var i = 0; i < newValue; i++)
                      if (properties.elements.length > i)
                        properties.elements[i]
                      else
                        []
                  ];
                  final newProperties = element
                      .getProperties<RowElementModel>()
                      .copyWith(elements: newColumns, columns: newValue);
                  editorState.canvas
                      .updateProperties(element, newProperties.toJson());
                }
              },
              items: [
                for (var i = 2; i < 5; i++)
                  RubricDropdownMenuItem(
                    value: i,
                    text: "$i Columns",
                  ),
              ],
              child: RubricText("Number of Columns"),
            ),
            ToolbarUniversalIcons(
              element: element,
            ),
          ],
        );
      },
    );
  }
}
