// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:rubric/src/elements/base/enums.dart';
import 'package:rubric/src/elements/button/button_elements.dart';
import 'package:rubric/src/elements/button/button_model.dart';
import 'package:rubric/src/elements/divider/divider_elements.dart';
import 'package:rubric/src/elements/divider/divider_model.dart';
import 'package:rubric/src/elements/html_text/html_text_elements.dart';
import 'package:rubric/src/elements/html_text/html_text_model.dart';
import 'package:rubric/src/elements/image/image_elements.dart';
import 'package:rubric/src/elements/image/image_model.dart';
import 'package:rubric/src/elements/link/link_elements.dart';
import 'package:rubric/src/elements/link/link_model.dart';
import 'package:rubric/src/elements/pdf/pdf_elements.dart';
import 'package:rubric/src/elements/pdf/pdf_model.dart';
import 'package:rubric/src/elements/row/row_elements.dart';
import 'package:rubric/src/elements/row/row_model.dart';
import 'package:rubric/src/elements/text/text_elements.dart';
import 'package:rubric/src/elements/text/text_model.dart';
import 'package:rubric/src/elements/text_list/text_list_elements.dart';
import 'package:rubric/src/elements/text_list/text_list_model.dart';
import 'package:rubric/src/elements/video/video_elements.dart';
import 'package:rubric/src/elements/video/video_model.dart';
import 'package:rubric/src/models/canvas.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/rubric_editor/models/style.dart';
import 'package:rubric/src/utilities/uuid.dart';

typedef ElementEditorBuilderFunction = Widget Function({Key? key, required ElementModel element});

typedef ElementBuilderFunction =
    Widget Function({Key? key, required ElementModel element, required CanvasModel canvas});

enum ElementCategories { text, interactive, media, flex, divider, other }

enum ElementType {
  heading(
    "Heading",
    ElementCategories.text,
    Icons.text_fields_rounded,
    focusable: true,
    editorBuilder: TextEditorElement.header,
    readerBuilder: TextReaderWidget.new,
  ),
  text(
    "Body",
    ElementCategories.text,
    Icons.text_snippet_outlined,
    focusable: true,
    editorBuilder: TextEditorElement.new,
    readerBuilder: TextReaderWidget.new,
  ),

  htmlText(
    "Text",
    ElementCategories.text,
    Icons.notes,
    focusable: true,
    editorBuilder: HtmlTextEditorElement.new,
    readerBuilder: HtmlTextReaderWidget.new,
  ),
  textList(
    "List",
    ElementCategories.text,
    Icons.list,
    editorBuilder: TextListEditorElement.new,
    readerBuilder: TextListReaderWidget.new,
  ),
  link(
    "Link",
    ElementCategories.interactive,
    Icons.link,
    focusable: true,
    editorBuilder: LinkEditorElement.new,
    readerBuilder: LinkReaderWidget.new,
  ),
  button(
    "Button",
    ElementCategories.interactive,
    Icons.ads_click_rounded,
    focusable: true,
    editorBuilder: ButtonEditorElement.new,
    readerBuilder: ButtonReaderWidget.new,
  ),

  image(
    "Image",
    ElementCategories.media,
    Icons.image_outlined,
    editorBuilder: ImageEditorElement.new,
    readerBuilder: ImageReaderElement.new,
  ),

  video(
    "Video",
    ElementCategories.media,

    Icons.ondemand_video_outlined,
    editorBuilder: VideoEditorElement.new,
    readerBuilder: VideoReaderElement.new,
  ),

  pdf(
    "Pdf",
    ElementCategories.media,
    Icons.picture_as_pdf,
    editorBuilder: PdfEditorElement.new,
    readerBuilder: PdfReaderElement.new,
  ),

  divider(
    "Divider",

    ElementCategories.divider,

    Icons.vertical_align_center_sharp,

    editorBuilder: DividerEditorElement.new,
    readerBuilder: DividerReaderElement.new,
  ),
  box(
    "Container",
    ElementCategories.flex,
    Icons.check_box_outline_blank_rounded,
    editorBuilder: RowEditorElement.new,
    readerBuilder: RowReaderElement.new,
  ),

  row(
    "Row",
    ElementCategories.flex,
    Icons.view_week_outlined,
    editorBuilder: RowEditorElement.new,
    readerBuilder: RowReaderElement.new,
  );

  final String title;
  final bool focusable;
  final ElementCategories category;
  final IconData icon;
  final ElementEditorBuilderFunction editorBuilder;
  final ElementBuilderFunction readerBuilder;

  const ElementType(
    this.title,
    this.category,
    this.icon, {
    this.focusable = false,
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
    return ElementModel(id: id ?? newID(), type: this, properties: generateDefaultProperties(this), padding: 0);
  }
}

enum BorderRadiusPresets {
  square(0),
  rounded(25),
  circular(1000);

  final double radius;
  const BorderRadiusPresets(this.radius);
}

Map<String, dynamic> generateDefaultProperties(ElementType elementType) {
  return switch (elementType) {
    ElementType.row => RowElementModel(color: Colors.transparent, elements: [[], []], columns: 2).toJson(),
    ElementType.box => RowElementModel(
      color: const Color.fromARGB(255, 0, 76, 138),
      elements: [[]],
      columns: 1,
    ).toJson(),
    ElementType.divider => const DividerElementModel(color: Colors.black, weight: 1).toJson(),
    ElementType.heading => TextElementModel(
      text: "",
      size: HeadingFontSizes.h3.value.toDouble(),
      isBold: false,
      isUnderline: false,
      alignment: "center",
      color: Colors.black,
    ).toJson(),
    ElementType.text => TextElementModel(
      text: "",
      size: FontSizes.medium.value.toDouble(),
      isBold: false,
      isItalic: false,
      isUnderline: false,
      color: Colors.black,
    ).toJson(),
    ElementType.htmlText => const HtmlTextElementModel(text: '').toJson(),
    ElementType.textList => TextListElementModel(
      textList: [""],
      size: RubricEditorStyle.minimumFontSize.toDouble(),
      isBold: false,
      isItalic: false,
      isUnderline: false,
      color: Colors.black,
    ).toJson(),
    ElementType.link => LinkElementModel(
      text: "",
      link: "",
      size: FontSizes.medium.value.toDouble(),
      isBold: false,
      isItalic: false,
      isUnderline: true,
      color: const Color.fromARGB(255, 0, 99, 181),
    ).toJson(),
    ElementType.button => ButtonElementModel(
      text: "Click Me",
      link: "",
      style: ButtonStyles.filled.name,
      color: const Color.fromARGB(255, 0, 99, 181),
      borderRadius: BorderRadiusPresets.rounded.radius,
      textColor: Colors.white,
    ).toJson(),
    ElementType.image => ImageElementModel(
      aspectRatio: AspectRatios.widescreen,
      borderRadius: 0,
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/academy-5q7q96.firebasestorage.app/o/static%2Fdefault_image.webp?alt=media",
      fit: "cover",
    ).toJson(),
    ElementType.video => VideoElementModel(
      isYoutube: false,
      videoUrl:
          "https://firebasestorage.googleapis.com/v0/b/academy-5q7q96.firebasestorage.app/o/static%2Fdefault_video.mp4?alt=media",
    ).toJson(),
    ElementType.pdf => PdfElementModel(
      pdfUrl:
          "https://firebasestorage.googleapis.com/v0/b/academy-5q7q96.firebasestorage.app/o/static%2Fdefault_pdf.pdf?alt=media",
    ).toJson(),
  };
}
