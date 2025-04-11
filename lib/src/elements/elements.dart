// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:rubric/src/elements/base/enums.dart';
import 'package:rubric/src/elements/box/box_elements.dart';
import 'package:rubric/src/elements/box/box_model.dart';
import 'package:rubric/src/elements/image/image_elements.dart';
import 'package:rubric/src/elements/image/image_model.dart';
import 'package:rubric/src/elements/text/text_elements.dart';
import 'package:rubric/src/elements/text/text_model.dart';
import 'package:rubric/src/elements/video/video_elements.dart';
import 'package:rubric/src/elements/video/video_model.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/models/style.dart';

typedef ElementBuilderFunction = Widget Function(
    {Key? key, required ElementModel element});

enum ElementTypes {
  text(
    "Text",
    Icons.text_fields_rounded,
    editorBuilder: TextEditorElement.new,
    layerBuilder: TextLayerWidget.new,
    readerBuilder: TextReaderWidget.new,
    focusable: true,
  ),

  image(
    "Image",
    Icons.image_outlined,
    editorBuilder: ImageEditorElement.new,
    layerBuilder: ImageLayerElement.new,
    readerBuilder: ImageReaderElement.new,
    focusable: false,
  ),

  video(
    "Video",
    Icons.ondemand_video_outlined,
    editorBuilder: VideoEditorElement.new,
    layerBuilder: VideoEditorElement.new,
    readerBuilder: VideoReaderElement.new,
    focusable: false,
  ),

  box(
    "Box",
    Icons.check_box_outline_blank_rounded,
    editorBuilder: BoxEditorElement.new,
    layerBuilder: BoxEditorElement.new,
    readerBuilder: BoxReaderElement.new,
    focusable: false,
  );

  // richtext(
  //   "Rich Text",
  //   Icons.text_fields_rounded,
  //   editorBuilder: RichTextEditorElement.new,
  //   layerBuilder: RichTextLayerWidget.new,
  //   readerBuilder: RichTextReaderWidget.new,
  //   focusable: true,
  // );

  final String title;
  final IconData icon;
  final ElementBuilderFunction editorBuilder;
  final ElementBuilderFunction layerBuilder;
  final ElementBuilderFunction readerBuilder;
  final bool focusable;
  const ElementTypes(
    this.title,
    this.icon, {
    required this.editorBuilder,
    required this.readerBuilder,
    required this.layerBuilder,
    required this.focusable,
  });

  // from name function
  static ElementTypes fromName(String name) {
    for (var el in ElementTypes.values) {
      if (el.name == name) {
        return el;
      }
    }
    throw Exception('Unknown element type: $name');
  }
}

enum BorderRadiusPresets {
  square(0),
  rounded(25),
  circular(1000);

  final double radius;
  const BorderRadiusPresets(this.radius);
}

Map<String, dynamic> generateDefaultProperties(
  BuildContext context,
  ElementTypes elementType,
) {
  return switch (elementType) {
    ElementTypes.box => BoxElementModel(
            color: Colors.green,
            borderRadius: 0,
            aspectRatio: AspectRatios.fourThree)
        .toJson(),
    // ElementTypes.heading => TextElementModel(
    //         text: "",
    //         size: RubricEditorStyle.minimumFontSize.toDouble(),
    //         isBold: false,
    //         color: Colors.black)
    //     .toJson(),
    ElementTypes.text => TextElementModel(
            text: "",
            size: RubricEditorStyle.minimumFontSize.toDouble(),
            isBold: false,
            isItalic: false,
            isUnderline: false,
            color: Colors.black)
        .toJson(),
    // ElementTypes.richtext => RichTextElementModel(
    //     document: Document(),
    //   ).toJson(),
    ElementTypes.image => ImageElementModel(
            aspectRatio: AspectRatios.fourThree,
            borderRadius: 0,
            imageUrl: "https://t0pc4t.github.io/public/default_image.webp",
            fit: "cover")
        .toJson(),
    ElementTypes.video => VideoElementModel(
        isYoutube: false,
        videoUrl: "https://t0pc4t.github.io/public/default_video.mp4",
      ).toJson(),
  };
}
