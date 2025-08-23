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
import 'package:rubric/src/elements/row/row_elements.dart';
import 'package:rubric/src/elements/row/row_model.dart';
import 'package:rubric/src/elements/text/text_elements.dart';
import 'package:rubric/src/elements/text/text_model.dart';
import 'package:rubric/src/elements/text_list/text_list_elements.dart';
import 'package:rubric/src/elements/text_list/text_list_model.dart';
import 'package:rubric/src/elements/video/video_elements.dart';
import 'package:rubric/src/elements/video/video_model.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/models/style.dart';
import 'package:rubric/src/utilities/uuid.dart';

typedef ElementBuilderFunction = Widget Function(
    {Key? key, required ElementModel element});

enum ElementType {
  heading(
    "Heading",
    Icons.text_fields_rounded,
    editorBuilder: TextEditorElement.header,
    readerBuilder: TextReaderWidget.new,
  ),
  text(
    "Body",
    Icons.text_snippet_outlined,
    editorBuilder: TextEditorElement.new,
    readerBuilder: TextReaderWidget.new,
  ),
  textList(
    "List",
    Icons.list,
    editorBuilder: TextListEditorElement.new,
    readerBuilder: TextListReaderWidget.new,
  ),
  link(
    "Link",
    Icons.link,
    editorBuilder: LinkEditorElement.new,
    readerBuilder: LinkReaderWidget.new,
  ),
  button(
    "Button",
    Icons.ads_click_rounded,
    editorBuilder: ButtonEditorElement.new,
    readerBuilder: ButtonReaderWidget.new,
  ),

  image(
    "Image",
    Icons.image_outlined,
    editorBuilder: ImageEditorElement.new,
    readerBuilder: ImageReaderElement.new,
  ),

  video(
    "Video",
    Icons.ondemand_video_outlined,
    editorBuilder: VideoEditorElement.new,
    readerBuilder: VideoReaderElement.new,
  ),

  box(
    "Box",
    Icons.check_box_outline_blank_rounded,
    editorBuilder: BoxEditorElement.new,
    readerBuilder: BoxReaderElement.new,
  ),

  row(
    "Row",
    Icons.view_week_outlined,
    editorBuilder: RowEditorElement.new,
    readerBuilder: RowReaderElement.new,
  ),

  divider(
    "Divider",
    Icons.vertical_align_center_sharp,
    editorBuilder: DividerEditorElement.new,
    readerBuilder: DividerReaderElement.new,
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

  final ElementBuilderFunction readerBuilder;
  const ElementType(
    this.title,
    this.icon, {
    required this.editorBuilder,
    required this.readerBuilder,
  });

  // from name function
  static ElementType fromName(String name) {
    for (var el in ElementType.values) {
      if (el.name == name) {
        return el;
      }
    }
    throw Exception('Unknown element type: $name');
  }

  ElementModel generateNewModel([String? id]) {
    return ElementModel(
      id: id ?? newID(),
      type: this,
      properties: generateDefaultProperties(this),
      padding: 0,
    );
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
  ElementType elementType,
) {
  return switch (elementType) {
    ElementType.box => BoxElementModel(
            color: Colors.green,
            borderRadius: 0,
            aspectRatio: AspectRatios.widescreen)
        .toJson(),
    ElementType.divider =>
      const DividerElementModel(color: Colors.black, weight: 1).toJson(),
    ElementType.heading => TextElementModel(
            text: "",
            size: HeadingFontSizes.h3.value.toDouble(),
            isBold: true,
            isUnderline: false,
            alignment: "center",
            color: Colors.black)
        .toJson(),
    ElementType.text => TextElementModel(
            text: "",
            size: FontSizes.medium.value.toDouble(),
            isBold: false,
            isItalic: false,
            isUnderline: false,
            color: Colors.black)
        .toJson(),
    ElementType.textList => TextListElementModel(
            textList: [""],
            size: RubricEditorStyle.minimumFontSize.toDouble(),
            isBold: false,
            isItalic: false,
            isUnderline: false,
            color: Colors.black)
        .toJson(),
    ElementType.link => LinkElementModel(
            text: "",
            link: "",
            size: FontSizes.medium.value.toDouble(),
            isBold: false,
            isItalic: false,
            isUnderline: true,
            color: Colors.blue)
        .toJson(),
    ElementType.button => ButtonElementModel(
        text: "Click Me",
        link: "",
        style: ButtonStyles.filled.name,
        color: const Color.fromARGB(255, 0, 162, 255),
        borderRadius: BorderRadiusPresets.rounded.radius,
        textColor: Colors.white,
      ).toJson(),
    ElementType.row => RowElementModel(
        elements: [
          [],
          [],
        ],
        columns: 2,
      ).toJson(),

    // ElementTypes.richtext => RichTextElementModel(
    //     document: Document(),
    //   ).toJson(),
    ElementType.image => ImageElementModel(
            aspectRatio: AspectRatios.widescreen,
            borderRadius: 0,
            imageUrl: "https://t0pc4t.github.io/public/default_image.webp",
            fit: "cover")
        .toJson(),
    ElementType.video => VideoElementModel(
        isYoutube: false,
        videoUrl: "https://t0pc4t.github.io/public/default_video.mp4",
      ).toJson(),
  };
}
