import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rubric/src/utilities/color.dart';

part 'text_model.freezed.dart';
part 'text_model.g.dart';

@freezed
abstract class TextElementModel with _$TextElementModel {
  const TextElementModel._();
  @JsonSerializable()
  const factory TextElementModel({
    required String text,
    required bool isBold,
    required double size,
    @JsonKey(toJson: colorToJson, fromJson: colorFromJson) required Color color,
  }) = _TextElementModel;

  factory TextElementModel.fromJson(Map<String, dynamic> json) =>
      _$TextElementModelFromJson(json);

  TextStyle textStyle() => TextStyle(
      color: color,
      fontSize: size,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      height: 1.5);
}
