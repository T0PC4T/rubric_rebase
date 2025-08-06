// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:rubric/src/elements/base/enums.dart';
import 'package:rubric/src/elements/box/box_elements.dart';
import 'package:rubric/src/elements/box/box_model.dart';
import 'package:rubric/src/elements/button/button_elements.dart';
import 'package:rubric/src/elements/button/button_model.dart';
import 'package:rubric/src/elements/divider/divider_elements.dart';
import 'package:rubric/src/elements/divider/divider_model.dart';
import 'package:rubric/src/elements/image/image_elements.dart';
import 'package:rubric/src/elements/image/image_model.dart';
import 'package:rubric/src/elements/link/link_elements.dart';
import 'package:rubric/src/elements/link/link_model.dart';
import 'package:rubric/src/elements/text/text_elements.dart';
import 'package:rubric/src/elements/text/text_model.dart';
import 'package:rubric/src/elements/text_list/text_list_elements.dart';
import 'package:rubric/src/elements/text_list/text_list_model.dart';
import 'package:rubric/src/elements/video/video_elements.dart';
import 'package:rubric/src/elements/video/video_model.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/models/style.dart';

typedef ElementBuilderFunction = Widget Function(
    {Key? key, required ElementModel element});

enum ElementTypes {
  heading(
    "Heading",
    Icons.text_fields_rounded,
    editorBuilder: TextEditorElement.header,
    layerBuilder: TextLayerWidget.new,
    readerBuilder: TextReaderWidget.new,
    focusable: true,
  ),
  text(
    "Body",
    Icons.text_snippet_outlined,
    editorBuilder: TextEditorElement.new,
    layerBuilder: TextLayerWidget.new,
    readerBuilder: TextReaderWidget.new,
    focusable: true,
  ),
  textList(
    "List",
    Icons.list,
    editorBuilder: TextListEditorElement.new,
    layerBuilder: TextListLayerWidget.new,
    readerBuilder: TextListReaderWidget.new,
    focusable: true,
  ),
  link(
    "Link",
    Icons.link,
    editorBuilder: LinkEditorElement.new,
    layerBuilder: TextLayerWidget.new,
    readerBuilder: LinkReaderWidget.new,
    focusable: true,
  ),
  button(
    "Button",
    Icons.ads_click_rounded,
    editorBuilder: ButtonEditorElement.new,
    layerBuilder: ButtonLayerWidget.new,
    readerBuilder: ButtonReaderWidget.new,
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
  ),

  divider(
    "Divider",
    Icons.vertical_align_center_sharp,
    editorBuilder: DividerEditorElement.new,
    layerBuilder: DividerEditorElement.new,
    readerBuilder: DividerReaderElement.new,
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
            aspectRatio: AspectRatios.widescreen)
        .toJson(),
    ElementTypes.divider =>
      const DividerElementModel(color: Colors.black, weight: 1).toJson(),
    ElementTypes.heading => TextElementModel(
            text: "",
            size: HeadingFontSizes.h3.value.toDouble(),
            isBold: true,
            isUnderline: false,
            alignment: "center",
            color: Colors.black)
        .toJson(),
    ElementTypes.text => TextElementModel(
            text: "",
            size: FontSizes.medium.value.toDouble(),
            isBold: false,
            isItalic: false,
            isUnderline: false,
            color: Colors.black)
        .toJson(),
    ElementTypes.textList => TextListElementModel(
            textList: [""],
            size: RubricEditorStyle.minimumFontSize.toDouble(),
            isBold: false,
            isItalic: false,
            isUnderline: false,
            color: Colors.black)
        .toJson(),
    ElementTypes.link => LinkElementModel(
            text: "",
            link: "",
            size: FontSizes.medium.value.toDouble(),
            isBold: false,
            isItalic: false,
            isUnderline: true,
            color: Colors.blue)
        .toJson(),
    ElementTypes.button => ButtonElementModel(
        text: "Click Me",
        link: "",
        style: ButtonStyles.filled.name,
        color: RubricEditorStyle.of(context).theme,
        borderRadius: BorderRadiusPresets.rounded.radius,
        textColor: Colors.white,
      ).toJson(),

    // ElementTypes.richtext => RichTextElementModel(
    //     document: Document(),
    //   ).toJson(),
    ElementTypes.image => ImageElementModel(
            aspectRatio: AspectRatios.widescreen,
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
