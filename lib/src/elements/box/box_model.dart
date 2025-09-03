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
    required double aspectRatio,
  }) = _BoxElementModel;

  factory BoxElementModel.fromJson(Map<String, dynamic> json) =>
      _$BoxElementModelFromJson(json);

  static String toHTML(Map<String, dynamic> properties) {
    final model = BoxElementModel.fromJson(properties);
    return '''
    <div style="
      background-color: #${colorToHex(model.color)};
      border-radius: ${model.borderRadius}px;
      aspect-ratio: ${model.aspectRatio};
      width: 100%;
    "></div>
    ''';
  }
}
