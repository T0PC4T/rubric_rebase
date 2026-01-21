import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:rubric/rubric.dart';
import 'package:rubric/src/components/atoms/divider.dart';
import 'package:rubric/src/components/shared.dart';
import 'package:rubric/src/elements/pdf/pdf_model.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/toolbar/element_toolbar.dart';

class PdfTooltipWidget extends StatefulWidget {
  final ElementModel element;
  const PdfTooltipWidget({super.key, required this.element});

  @override
  State<PdfTooltipWidget> createState() => _PdfTooltipWidgetState();
}

class _PdfTooltipWidgetState extends State<PdfTooltipWidget> {
  String lastValue = "";
  @override
  Widget build(BuildContext context) {
    final editorState = RubricEditorState.of(context);
    final properties = widget.element.getProperties<PdfElementModel>();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // RubricIconTextButton(
        //   onTap: () async {
        //     final pdfUrl = await PopupWidget.showPopup<String>(
        //       context,
        //       (closeWith) {
        //         return SizedBox(
        //           width: PopupWidget.popWidth,
        //           child: Column(
        //             children: [
        //               RubricText(
        //                 "Enter Pdf Link",
        //                 textType: TextType.title,
        //               ),
        //               Padding(
        //                 padding: RubricEditorStyle.padding,
        //                 child: RubricTextField(
        //                   onComplete: closeWith,
        //                   onChanged: (value) {
        //                     lastValue = value;
        //                   },
        //                   helpText: "https://example.com/document.pdf",
        //                   initialValue: properties.pdfUrl,
        //                 ),
        //               ),
        //               RubricButton.light(editorState.style,
        //                   width: 150,
        //                   height: 30,
        //                   onTap: () => closeWith(lastValue),
        //                   child: Text("Save Link"))
        //             ],
        //           ),
        //         );
        //       },
        //     );
        //     if (pdfUrl case String newUrl) {
        //       editorState.canvas.updateProperties<PdfElementModel>(
        //           widget.element, (properties) {
        //         return properties.copyWith(pdfUrl: newUrl).toJson();
        //       });
        //     }
        //   },
        //   iconData: Icons.link,
        //   text: "Pdf Link",
        // ),
        RubricVerticleDivider(),
        RubricIconTextButton(
          onTap: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles(
              allowMultiple: false,
              type: FileType.custom,
              allowedExtensions: ['pdf'],
            );
            if (result case FilePickerResult result) {
              Uint8List? fileBytes = result.files.first.bytes;
              if (fileBytes != null) {
                final pdfUrl = await editorState.widget.bytesToURL(fileBytes, name: result.files.first.name);
                editorState.canvas.updateProperties<PdfElementModel>(widget.element, (properties) {
                  return properties.copyWith(pdfUrl: pdfUrl).toJson();
                });
              }
            }
          },
          iconData: Icons.image,
          text: "Upload Pdf File",
        ),
        ToolbarUniversalIcons(element: widget.element),
      ],
    );
  }
}
