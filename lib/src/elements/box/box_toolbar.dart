import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/components/atoms/divider.dart';
import 'package:rubric/src/components/atoms/popup.dart';
import 'package:rubric/src/components/molecules/border_radius_dropdown.dart';
import 'package:rubric/src/components/molecules/color_picker.dart';
import 'package:rubric/src/components/shared.dart';
import 'package:rubric/src/elements/base/enums.dart';
import 'package:rubric/src/elements/box/box_model.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/toolbar/dropdown.dart';
import 'package:rubric/src/rubric_editor/toolbar/element_toolbar.dart';
import 'package:rubric/src/rubric_icon/icon_widget.dart';

class BoxTooltipWidget extends StatelessWidget {
  final ElementModel element;
  const BoxTooltipWidget({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    final editorState = RubricEditorState.of(context);
    final style = editorState.style;
    final properties = element.getProperties<BoxElementModel>();
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
                editorState.canvas.updateProperties<BoxElementModel>(
                  element,
                  (properties) => properties.copyWith(color: newColor).toJson(),
                );

                // editorState.canvas.updateProperties(
                //   element,
                //   properties.copyWith(color: newColor).toJson(),
                // );
              }
            },
          ),
        ),
        RubricVerticleDivider(),
        RubricBorderRadiusDropdown(
          radius: properties.borderRadius,
          onChanged: (value) {
            if (value case double newValue) {
              editorState.canvas.updateProperties<BoxElementModel>(
                  element,
                  (properties) =>
                      properties.copyWith(borderRadius: newValue).toJson());
            }
          },
        ),
        RubricVerticleDivider(),
        RubricToolbarDropdown(
          onUpdate: (value) {
            if (value case double newValue) {
              editorState.canvas.updateProperties<BoxElementModel>(
                  element,
                  (properties) =>
                      properties.copyWith(aspectRatio: newValue).toJson());
            }

            // if (value case double newValue) {
            //   final newProperties = element
            //       .getProperties<BoxElementModel>()
            //       .copyWith(aspectRatio: newValue);
            //   editorState.canvas
            //       .updateProperties(element, newProperties.toJson());
            // }
          },
          items: [
            for (var ratio in AspectRatios.values)
              RubricDropdownMenuItem(
                value: ratio,
                text: AspectRatios.doubleToRatio(ratio),
              ),
          ],
          child: Row(
            spacing: RubricEditorStyle.paddingUnit * 0.5,
            children: [
              RubricIcon(
                Icons.aspect_ratio,
                size: ElementToolbarWidget.iconSize,
              ),
              RubricText("Aspect Ratio"),
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
