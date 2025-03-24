import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/components/atoms/divider.dart';
import 'package:rubric/src/components/atoms/popup.dart';
import 'package:rubric/src/components/molecules/border_radius_dropdown.dart';
import 'package:rubric/src/components/molecules/color_picker.dart';
import 'package:rubric/src/components/shared.dart';
import 'package:rubric/src/elements/box/box_model.dart';
import 'package:rubric/src/models/elements.dart';

class BoxTooltipWidget extends StatelessWidget {
  final ElementModel element;
  const BoxTooltipWidget({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    final editorState = RubricEditorState.of(context);
    return ValueListenableBuilder(
      valueListenable: editorState.canvas,
      builder: (context, canvas, _) {
        final newElement = editorState.canvas.getElement(element.id);
        final properties = newElement.getProperties<BoxElementModel>();
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                    editorState.canvas.updateElement(
                      element,
                      properties.copyWith(color: newColor).toJson(),
                    );
                  }
                },
              ),
            ),
            RubricVerticleDivider(),
            RubricBorderRadiusDropdown(
              radius: properties.borderRadius,
              onChanged: (value) {
                if (value case double newValue) {
                  final newProperties = properties.copyWith(
                    borderRadius: newValue,
                  );
                  editorState.canvas.updateElement(
                    element,
                    newProperties.toJson(),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
