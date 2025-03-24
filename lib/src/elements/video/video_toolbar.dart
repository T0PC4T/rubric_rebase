import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/components/atoms/divider.dart';
import 'package:rubric/src/components/atoms/popup.dart';
import 'package:rubric/src/components/shared.dart';
import 'package:rubric/src/elements/video/video_model.dart';
import 'package:rubric/src/models/elements.dart';

class VideoTooltipWidget extends StatelessWidget {
  final ElementModel element;
  const VideoTooltipWidget({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    final editorState = RubricEditorState.of(context);
    final properties = element.getProperties<VideoElementModel>();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        RubricIconTextButton(
          onTap: () async {
            final videoUrl = await PopupWidget.showPopup<String>(
              context,
              (closeWith) {
                return SizedBox(
                  width: PopupWidget.popWidth,
                  child: Column(
                    children: [
                      RubricText(
                        "Enter Youtube Link",
                        textType: TextType.title,
                      ),
                      RubricTextField(
                        onChanged: closeWith,
                        helpText: "https://www.youtube.com/watch?v=abcdefgh",
                        initialValue:
                            properties.isYoutube ? properties.videoUrl : "",
                      ),
                      RubricText(
                        "[Press Enter to Continue]",
                      ),
                    ],
                  ),
                );
              },
            );
            if (videoUrl case String newUrl) {
              editorState.canvas.updateElement(
                element,
                properties.copyWith(videoUrl: newUrl, isYoutube: true).toJson(),
              );
            }
          },
          iconData: Icons.link,
          text: "Youtube Link",
        ),
        RubricVerticleDivider(),
        RubricIconTextButton(
          onTap: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles(
              allowMultiple: false,
              type: FileType.video,
            );
            if (result case FilePickerResult result) {
              Uint8List? fileBytes = result.files.first.bytes;
              if (fileBytes != null) {
                final videoUrl = await editorState.widget.bytesToURL(
                  fileBytes,
                  name: result.files.first.name,
                );
                editorState.canvas.updateElement(
                  element,
                  properties
                      .copyWith(videoUrl: videoUrl, isYoutube: false)
                      .toJson(),
                );
              }
            }
          },
          iconData: Icons.image,
          text: "Upload Video File",
        ),
      ],
    );
  }
}
