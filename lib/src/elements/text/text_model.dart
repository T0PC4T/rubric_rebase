import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rubric/src/elements/base/enums.dart';
import 'package:rubric/src/utilities/color.dart';

part 'text_model.freezed.dart';
part 'text_model.g.dart';

@freezed
abstract class TextElementModel with _$TextElementModel {
  const TextElementModel._();
  @JsonSerializable()
  const factory TextElementModel({
    required String text,
    @Default(false) bool isBold,
    @Default(false) bool isItalic,
    @Default(false) isUnderline,
    @Default(ElementAlignment.left) String alignment,
    required double size,
    @JsonKey(toJson: colorToJson, fromJson: colorFromJson) required Color color,
  }) = _TextElementModel;

  factory TextElementModel.fromJson(Map<String, dynamic> json) =>
      _$TextElementModelFromJson(json);

  TextStyle textStyle() => TextStyle(
      color: color,
      fontSize: size,
      fontFamily: "Roboto",
      letterSpacing: 0.1,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
      decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
      height: 1.6);
}
