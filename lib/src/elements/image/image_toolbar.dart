import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/components/atoms/divider.dart';
import 'package:rubric/src/components/molecules/border_radius_dropdown.dart';
import 'package:rubric/src/components/shared.dart';
import 'package:rubric/src/elements/base/enums.dart';
import 'package:rubric/src/elements/image/image_model.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/toolbar/dropdown.dart';
import 'package:rubric/src/rubric_editor/toolbar/element_toolbar.dart';
import 'package:rubric/src/rubric_icon/icon_widget.dart';

class ImageTooltipWidget extends StatelessWidget {
  final ElementModel element;
  const ImageTooltipWidget({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    final editorState = RubricEditorState.of(context);
    final style = editorState.style;
    final properties = element.getProperties<ImageElementModel>();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        RubricIconTextButton(
          onTap: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles(
              allowMultiple: false,
              type: FileType.image,
            );
            if (result case FilePickerResult result) {
              Uint8List? fileBytes = result.files.first.bytes;
              if (fileBytes != null) {
                final imageUrl = await editorState.widget.bytesToURL(
                  fileBytes,
                  name: result.files.first.name,
                );
                editorState.canvas.updateProperties<ImageElementModel>(
                    element,
                    (properties) =>
                        properties.copyWith(imageUrl: imageUrl).toJson());
              }
            }
          },
          iconData: Icons.image_outlined,
          text: "Upload Image",
        ),
        RubricVerticleDivider(),
        RubricBorderRadiusDropdown(
          radius: properties.borderRadius,
          onChanged: (value) {
            if (value case double newValue) {
              editorState.canvas.updateProperties<ImageElementModel>(
                  element,
                  (properties) =>
                      properties.copyWith(borderRadius: newValue).toJson());
            }
          },
        ),
        RubricVerticleDivider(),
        RubricToolbarDropdown(
          onUpdate: (value) {
            if (value case String newValue) {
              editorState.canvas.updateProperties<ImageElementModel>(element,
                  (properties) => properties.copyWith(fit: newValue).toJson());
            }
          },
          items: [
            for (var value in ImageFits.all)
              RubricDropdownMenuItem(
                value: value,
                text: value,
              ),
          ],
          child: Row(
            spacing: RubricEditorStyle.paddingUnit * 0.5,
            children: [
              RubricIcon(
                Icons.crop_outlined,
                size: ElementToolbarWidget.iconSize,
              ),
              RubricText("Fit"),
            ],
          ),
        ),
        RubricVerticleDivider(),

        // Aspect Ratio
        RubricToolbarDropdown(
          onUpdate: (value) {
            if (value case double newValue) {
              editorState.canvas.updateProperties<ImageElementModel>(
                  element,
                  (properties) =>
                      properties.copyWith(aspectRatio: newValue).toJson());
            }
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
