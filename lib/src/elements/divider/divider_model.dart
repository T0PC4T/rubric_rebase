import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rubric/src/utilities/color.dart';

part 'divider_model.freezed.dart';
part 'divider_model.g.dart';

@freezed
class DividerElementModel with _$DividerElementModel {
  @JsonSerializable()
  const factory DividerElementModel({
    @JsonKey(toJson: colorToJson, fromJson: colorFromJson) required Color color,
    required double weight,
  }) = _DividerElementModel;

  factory DividerElementModel.fromJson(Map<String, dynamic> json) =>
      _$DividerElementModelFromJson(json);
}
