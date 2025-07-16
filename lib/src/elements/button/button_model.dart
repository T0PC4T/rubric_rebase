import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rubric/src/utilities/color.dart';

part 'button_model.freezed.dart';
part 'button_model.g.dart';

@freezed
abstract class ButtonElementModel with _$ButtonElementModel {
  const ButtonElementModel._();
  @JsonSerializable()
  const factory ButtonElementModel({
    required String text,
    required String style,
    required String link,
    required double borderRadius,
    @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
    required Color textColor,
    @JsonKey(toJson: colorToJson, fromJson: colorFromJson) required Color color,
  }) = _ButtonElementModel;

  factory ButtonElementModel.fromJson(Map<String, dynamic> json) =>
      _$ButtonElementModelFromJson(json);
}

enum ButtonStyles {
  text("Text", "text"),
  outlined("Outlined", "outlined"),
  filled("Filled", "filled");

  final String name;
  final String value;
  const ButtonStyles(this.name, this.value);
  static ButtonStyles fromString(String value) {
    return ButtonStyles.values.firstWhere(
      (element) => element.value == value,
      orElse: () => ButtonStyles.filled,
    );
  }
}
