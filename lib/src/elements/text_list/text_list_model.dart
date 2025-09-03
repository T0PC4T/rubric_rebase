import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rubric/src/utilities/color.dart';

part 'text_list_model.freezed.dart';
part 'text_list_model.g.dart';

enum TextListTypes {
  bulleted,
  numbered,
}

@freezed
abstract class TextListElementModel with _$TextListElementModel {
  const TextListElementModel._();
  @JsonSerializable()
  const factory TextListElementModel({
    required List<String> textList,
    @Default(false) bool isBold,
    @Default(false) bool isItalic,
    @Default(false) isUnderline,
    @Default(TextListTypes.bulleted) TextListTypes textListType,
    required double size,
    @JsonKey(toJson: colorToJson, fromJson: colorFromJson) required Color color,
  }) = _TextListElementModel;

  factory TextListElementModel.fromJson(Map<String, dynamic> json) =>
      _$TextListElementModelFromJson(json);

  TextStyle textStyle() => TextStyle(
        color: color,
        fontSize: size,
        fontFamily: "Roboto",
        letterSpacing: 0.1,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
        decoration:
            isUnderline ? TextDecoration.underline : TextDecoration.none,
      );

  static String toHTML(Map<String, dynamic> properties) {
    final model = TextListElementModel.fromJson(properties);
    String listItems = '';
    for (int i = 0; i < model.textList.length; i++) {
      String itemText = model.textList[i];
      if (model.isBold) {
        itemText = '<b>$itemText</b>';
      }
      if (model.isItalic) {
        itemText = '<i>$itemText</i>';
      }
      if (model.isUnderline) {
        itemText = '<u>$itemText</u>';
      }

      if (model.textListType == TextListTypes.numbered) {
        listItems += '<li>$itemText</li>';
      } else {
        listItems += '<li>$itemText</li>';
      }
    }

    String listTag = model.textListType == TextListTypes.numbered ? 'ol' : 'ul';

    return '''
    <$listTag style="
      color: #${colorToHex(model.color)};
      font-size: ${model.size}px;
      font-family: 'Roboto';
      letter-spacing: 0.1px;
      font-weight: ${model.isBold ? 'bold' : 'normal'};
      font-style: ${model.isItalic ? 'italic' : 'normal'};
      text-decoration: ${model.isUnderline ? 'underline' : 'none'};
    ">$listItems</$listTag>
    ''';
  }
}
