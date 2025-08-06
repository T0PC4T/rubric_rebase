import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rubric/src/elements/base/enums.dart';
import 'package:rubric/src/elements/text/text_model.dart';
import 'package:rubric/src/utilities/color.dart';

part 'link_model.freezed.dart';
part 'link_model.g.dart';

@freezed
abstract class LinkElementModel
    with _$LinkElementModel
    implements TextElementBaseModel {
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

  factory LinkElementModel.fromJson(Map<String, dynamic> json) =>
      _$LinkElementModelFromJson(json);

  @override
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
}
