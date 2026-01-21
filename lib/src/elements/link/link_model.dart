import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rubric/src/elements/base/enums.dart';
import 'package:rubric/src/elements/text/text_model.dart';
import 'package:rubric/src/utilities/color.dart';

part 'link_model.freezed.dart';
part 'link_model.g.dart';

@freezed
abstract class LinkElementModel with _$LinkElementModel implements TextElementBaseModel {
  const LinkElementModel._();
  @JsonSerializable()
  const factory LinkElementModel({
    required String text,
    @Default(false) bool isBold,
    @Default(false) bool isItalic,
    @Default(true) bool isUnderline,
    @Default(ElementAlignment.left) String alignment,
    required double size,
    @JsonKey(toJson: colorToJson, fromJson: colorFromJson) required Color color,
    required String link,
  }) = _LinkElementModel;

  factory LinkElementModel.fromJson(Map<String, dynamic> json) => _$LinkElementModelFromJson(json);

  @override
  TextStyle textStyle() => TextStyle(
    color: color,
    fontSize: size,
    fontFamily: "Roboto",
    letterSpacing: 0.1,
    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
    fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
    decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
  );

  static String toHTML(Map<String, dynamic> properties) {
    final model = LinkElementModel.fromJson(properties);
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
    <a href="${model.link}" style="
      color: #${colorToHex(model.color)};
      font-size: ${model.size}px;
      font-family: 'Roboto';
      letter-spacing: 0.1px;
      font-weight: ${model.isBold ? 'bold' : 'normal'};
      font-style: ${model.isItalic ? 'italic' : 'normal'};
      text-decoration: ${model.isUnderline ? 'underline' : 'none'};
      text-align: ${model.alignment};
    ">$html</a>
    ''';
  }
}
