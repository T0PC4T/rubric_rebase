import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/components/atoms/divider.dart';
import 'package:rubric/src/components/atoms/popup.dart';
import 'package:rubric/src/components/molecules/color_picker.dart';
import 'package:rubric/src/components/shared.dart';
import 'package:rubric/src/elements/base/enums.dart';
import 'package:rubric/src/elements/row/row_model.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/toolbar/dropdown.dart';
import 'package:rubric/src/rubric_editor/toolbar/element_toolbar.dart';
import 'package:rubric/src/rubric_icon/icon_widget.dart';

class RowTooltipWidget extends StatelessWidget {
  final ElementModel element;
  const RowTooltipWidget({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    final editorState = RubricEditorState.of(context);
    final style = editorState.style;
    final properties = element.getProperties<RowElementModel>();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: style.radius),
        Padding(
          padding: RubricEditorStyle.padding,
          child: RubricColorButton(
            color: properties.color,
            onTap: () async {
              final newColor = await PopupWidget.showPopup<Color>(context, (closeWith) {
                return RubricColorPicker(onComplete: closeWith, color: properties.color);
              });
              if (newColor != null) {
                editorState.canvas.updateProperties<RowElementModel>(
                  element,
                  (properties) => properties.copyWith(color: newColor).toJson(),
                );
              }
            },
          ),
        ),
        RubricToolbarDropdown<int>(
          onUpdate: (value) {
            if (value case int newValue) {
              final newColumns = <List<Map<String, dynamic>>>[
                for (var i = 0; i < newValue; i++)
                  if (properties.elements.length > i) properties.elements[i] else [],
              ];
              editorState.canvas.updateProperties<RowElementModel>(
                element,
                (properties) => properties.copyWith(elements: newColumns, columns: newValue).toJson(),
              );
            }
          },
          items: [for (var i = 1; i < 5; i++) RubricDropdownMenuItem(value: i, text: "$i Columns")],
          child: RubricText("Number of Columns"),
        ),
        RubricVerticleDivider(),
        RubricToolbarDropdown<String>(
          onUpdate: (value) {
            if (value case String newValue) {
              editorState.canvas.updateProperties<RowElementModel>(
                element,
                (properties) => properties.copyWith(crossAxisAlignment: newValue).toJson(),
              );
            }
          },
          items: [
            for (var alignment in RowCrossAxisAlignment.all)
              RubricDropdownMenuItem(value: alignment, text: RowCrossAxisAlignment.toDisplayName(alignment)),
          ],
          child: Row(
            spacing: RubricEditorStyle.paddingUnit * 0.5,
            children: [
              RubricIcon(
                RowCrossAxisAlignment.toIcon(properties.crossAxisAlignment),
                size: ElementToolbarWidget.iconSize,
              ),
              RubricText("Align Items"),
            ],
          ),
        ),
        ToolbarUniversalIcons(element: element),
      ],
    );
  }
}
