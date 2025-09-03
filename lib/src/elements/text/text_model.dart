import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rubric/src/elements/base/enums.dart';
import 'package:rubric/src/elements/link/link_model.dart';
import 'package:rubric/src/utilities/color.dart';

part 'text_model.freezed.dart';
part 'text_model.g.dart';

abstract class TextElementType {
  String get text;
}

abstract class TextElementBaseModel implements TextElementType {
  TextStyle textStyle();
  double get size;
  bool get isBold;
  bool get isItalic;
  bool get isUnderline;
  String get alignment;
  Color get color;

  static T copyGeneric<T extends TextElementBaseModel>(
      {required TextElementBaseModel object,
      String? text,
      bool? isBold,
      bool? isItalic,
      bool? isUnderline,
      String? alignment,
      double? size,
      Color? color,
      String? link}) {
    switch (object) {
      case TextElementModel model:
        return model.copyWith(
          text: text ?? model.text,
          isBold: isBold ?? model.isBold,
          isItalic: isItalic ?? model.isItalic,
          isUnderline: isUnderline ?? model.isUnderline,
          alignment: alignment ?? model.alignment,
          size: size ?? model.size,
          color: color ?? model.color,
        ) as T;
      case LinkElementModel model:
        return model.copyWith(
          text: text ?? model.text,
          isBold: isBold ?? model.isBold,
          isItalic: isItalic ?? model.isItalic,
          isUnderline: isUnderline ?? model.isUnderline,
          alignment: alignment ?? model.alignment,
          size: size ?? model.size,
          color: color ?? model.color,
          link: link ?? model.link,
        ) as T;

      default:
        throw Exception("Unknown TextElementBaseModel type");
    }
  }
}

@freezed
abstract class TextElementModel
    with _$TextElementModel
    implements TextElementBaseModel {
  const TextElementModel._();
  @JsonSerializable()
  const factory TextElementModel({
    required String text,
    @Default(false) bool isBold,
    @Default(false) bool isItalic,
    @Default(false) bool isUnderline,
    @Default(ElementAlignment.left) String alignment,
    required double size,
    @JsonKey(toJson: colorToJson, fromJson: colorFromJson) required Color color,
  }) = _TextElementModel;

  factory TextElementModel.fromJson(Map<String, dynamic> json) =>
      _$TextElementModelFromJson(json);

  @override
  TextStyle textStyle() => TextStyle(
        color: color,
        fontSize: size,
        fontFamily: "Roboto",
        letterSpacing: 0.1,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
        height: 1.6,
        decoration:
            isUnderline ? TextDecoration.underline : TextDecoration.none,
      );

  static String toHTML(Map<String, dynamic> properties) {
    final model = TextElementModel.fromJson(properties);
    String html = model.text;

    if (model.isBold) {
      html = '<b>$html</b>';
    }
    if (model.isItalic) {
      html = '<i>$html</i>';
    }
    if (model.isUnderline) {
      html = '<u>$html</u>';
    }

    return '''
    <p style="
      color: #${colorToHex(model.color)};
      font-size: ${model.size}px;
      font-family: 'Roboto';
      letter-spacing: 0.1px;
      font-weight: ${model.isBold ? 'bold' : 'normal'};
      font-style: ${model.isItalic ? 'italic' : 'normal'};
      line-height: 1.6;
      text-decoration: ${model.isUnderline ? 'underline' : 'none'};
      text-align: ${model.alignment};
    ">$html</p>
    ''';
  }
}
