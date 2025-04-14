import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/components/atoms/divider.dart';
import 'package:rubric/src/components/atoms/popup.dart';
import 'package:rubric/src/components/molecules/color_picker.dart';
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

    return ValueListenableBuilder(
        valueListenable: editorState.canvas,
        builder: (context, canvalModel, child) {
          final properties =
              canvalModel.element(element.id).getProperties<TextElementModel>();
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              RubricIconButton(
                  isActive: properties.isBold,
                  size: ElementToolbarWidget.elementToolbarHeight,
                  onTap: () {
                    final newProperties =
                        element.getProperties<TextElementModel>();
                    editorState.canvas.updateElement(
                        element,
                        newProperties
                            .copyWith(isBold: !newProperties.isBold)
                            .toJson());
                  },
                  iconData: Icons.format_bold),
              RubricIconButton(
                  isActive: properties.isItalic,
                  size: ElementToolbarWidget.elementToolbarHeight,
                  onTap: () {
                    final newProperties =
                        element.getProperties<TextElementModel>();
                    editorState.canvas.updateElement(
                        element,
                        newProperties
                            .copyWith(isItalic: !newProperties.isItalic)
                            .toJson());
                  },
                  iconData: Icons.format_italic),
              RubricIconButton(
                  isActive: properties.isUnderline,
                  size: ElementToolbarWidget.elementToolbarHeight,
                  onTap: () {
                    final newProperties =
                        element.getProperties<TextElementModel>();
                    editorState.canvas.updateElement(
                        element,
                        newProperties
                            .copyWith(isUnderline: !newProperties.isUnderline)
                            .toJson());
                  },
                  iconData: Icons.format_underline),
              RubricVerticleDivider(),
              for (var align in ElementAlignment.all)
                RubricIconButton(
                    isActive: properties.alignment == align,
                    size: ElementToolbarWidget.elementToolbarHeight,
                    onTap: () {
                      final newProperties =
                          element.getProperties<TextElementModel>();
                      editorState.canvas.updateElement(element,
                          newProperties.copyWith(alignment: align).toJson());
                    },
                    iconData: ElementAlignment.icon(align)),
              RubricVerticleDivider(),
              Padding(
                padding: RubricEditorStyle.padding,
                child: RubricColorButton(
                  color: properties.color,
                  onTap: () async {
                    final newColor =
                        await PopupWidget.showPopup<Color>(context, (
                      closeWith,
                    ) {
                      return RubricColorPicker(
                        onComplete: closeWith,
                        color: properties.color,
                      );
                    });
                    if (newColor != null) {
                      editorState.canvas.updateElement(
                        element,
                        properties.copyWith(color: newColor).toJson(),
                      );
                    }
                  },
                ),
              ),
              RubricToolbarDropdown(
                onUpdate: (value) {
                  if (value case double newValue) {
                    final newProperties = element
                        .getProperties<TextElementModel>()
                        .copyWith(size: newValue);
                    editorState.canvas
                        .updateElement(element, newProperties.toJson());
                  }
                },
                items: [
                  for (var value in FontSizes.values)
                    RubricDropdownMenuItem(
                      value: value.value,
                      text: value.display,
                    ),
                ],
                child: RubricText("Font Size"),
              ),
              ToolbarUniversalIcons(
                element: element,
              ),
            ],
          );
        });
  }
}
