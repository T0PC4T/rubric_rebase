import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/components/shared.dart';
import 'package:rubric/src/elements/base/enums.dart';
import 'package:rubric/src/elements/text/text_model.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/toolbar/dropdown.dart';
import 'package:rubric/src/rubric_editor/toolbar/element_toolbar.dart';

class TextTooltipWidget extends StatelessWidget {
  final ElementModel element;
  final TextEditingController controller;
  final UndoHistoryController undoController;
  const TextTooltipWidget({
    super.key,
    required this.element,
    required this.controller,
    required this.undoController,
  });

  @override
  Widget build(BuildContext context) {
    final editorState = RubricEditorState.of(context);
    final style = editorState.style;
    final properties = element.getProperties<TextElementModel>();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        RubricIconButton(
            size: ElementToolbarWidget.elementToolbarHeight,
            onTap: () {
              final newProperties = element.getProperties<TextElementModel>();
              editorState.canvas.updateElement(
                  element,
                  newProperties
                      .copyWith(isBold: !newProperties.isBold)
                      .toJson());
            },
            iconData: Icons.format_bold),
        RubricToolbarDropdown(
          onUpdate: (value) {
            if (value case double newValue) {
              final newProperties = element
                  .getProperties<TextElementModel>()
                  .copyWith(size: newValue);
              editorState.canvas.updateElement(element, newProperties.toJson());
            }
          },
          items: [
            for (var value in FontSizes.values)
              RubricDropdownMenuItem(
                value: value.value,
                text: value.display,
              ),
          ],
          child: Row(
            spacing: RubricEditorStyle.paddingUnit * 0.5,
            children: [
              Icon(
                Icons.text_fields_rounded,
                size: ElementToolbarWidget.iconSize,
              ),
              RubricText("Font Size"),
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
