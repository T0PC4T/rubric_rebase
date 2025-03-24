import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rubric/src/utilities/color.dart';

part 'box_model.freezed.dart';
part 'box_model.g.dart';

@freezed
class BoxElementModel with _$BoxElementModel {
  @JsonSerializable()
  const factory BoxElementModel({
    @JsonKey(toJson: colorToJson, fromJson: colorFromJson) required Color color,
    required double borderRadius,
  }) = _BoxElementModel;

  factory BoxElementModel.fromJson(Map<String, dynamic> json) =>
      _$BoxElementModelFromJson(json);
}
