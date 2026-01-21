import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rubric/src/utilities/color.dart';

part 'divider_model.freezed.dart';
part 'divider_model.g.dart';

@freezed
abstract class DividerElementModel with _$DividerElementModel {
  const DividerElementModel._();

  @JsonSerializable()
  const factory DividerElementModel({
    @JsonKey(toJson: colorToJson, fromJson: colorFromJson) required Color color,
    required double weight,
  }) = _DividerElementModel;

  factory DividerElementModel.fromJson(Map<String, dynamic> json) => _$DividerElementModelFromJson(json);

  static String toHTML(Map<String, dynamic> properties) {
    final model = DividerElementModel.fromJson(properties);
    return '''
    <hr style="
      border: none;
      border-top: ${model.weight}px solid #${colorToHex(model.color)};
      margin: 0;
    ">
    ''';
  }
}
