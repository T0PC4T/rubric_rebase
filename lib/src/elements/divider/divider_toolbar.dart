import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/components/atoms/divider.dart';
import 'package:rubric/src/components/atoms/popup.dart';
import 'package:rubric/src/components/molecules/color_picker.dart';
import 'package:rubric/src/components/shared.dart';
import 'package:rubric/src/elements/divider/divider_model.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/toolbar/dropdown.dart';
import 'package:rubric/src/rubric_editor/toolbar/element_toolbar.dart';
import 'package:rubric/src/rubric_icon/icon_widget.dart';

class DividerTooltipWidget extends StatelessWidget {
  final ElementModel element;
  const DividerTooltipWidget({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    final editorState = RubricEditorState.of(context);
    final style = editorState.style;
    final properties = element.getProperties<DividerElementModel>();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: RubricEditorStyle.padding,
          child: RubricColorButton(
            color: properties.color,
            onTap: () async {
              final newColor = await PopupWidget.showPopup<Color>(context, (
                closeWith,
              ) {
                return RubricColorPicker(
                  onComplete: closeWith,
                  color: properties.color,
                );
              });
              if (newColor != null) {
                editorState.canvas.updateProperties<DividerElementModel>(
                  element,
                  (properties) => properties.copyWith(color: newColor).toJson(),
                );
              }
            },
          ),
        ),
        RubricVerticleDivider(),
        RubricToolbarDropdown(
          onUpdate: (value) {
            if (value case double newValue) {
              editorState.canvas.updateProperties<DividerElementModel>(
                  element,
                  (properties) =>
                      properties.copyWith(weight: newValue).toJson());
            }
          },
          items: [
            for (var i = 0; i <= 5; i++)
              RubricDropdownMenuItem(
                value: i,
                text: "${i}px",
              ),
          ],
          child: Row(
            spacing: RubricEditorStyle.paddingUnit * 0.5,
            children: [
              RubricIcon(
                Icons.line_weight,
                size: ElementToolbarWidget.iconSize,
              ),
              RubricText("Line Weight"),
            ],
          ),
        ),
        ToolbarUniversalIcons(
          element: element,
        ),
      ],
    );
  }
}
