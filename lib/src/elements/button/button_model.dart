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
    @JsonKey(toJson: colorToJson, fromJson: colorFromJson) required Color textColor,
    @JsonKey(toJson: colorToJson, fromJson: colorFromJson) required Color color,
  }) = _ButtonElementModel;

  factory ButtonElementModel.fromJson(Map<String, dynamic> json) => _$ButtonElementModelFromJson(json);
  static String toHTML(Map<String, dynamic> properties) {
    final model = ButtonElementModel.fromJson(properties);
    String buttonStyle = '';
    String textColor = colorToHex(model.textColor);
    String backgroundColor = colorToHex(model.color);
    String borderColor = colorToHex(model.color);

    switch (ButtonStyles.fromString(model.style)) {
      case ButtonStyles.text:
        buttonStyle = 'background-color: transparent; border: none;';
        break;
      case ButtonStyles.outlined:
        buttonStyle = 'background-color: transparent; border: 1px solid #$borderColor;';
        break;
      case ButtonStyles.filled:
        buttonStyle = 'background-color: #$backgroundColor; border: none;';
        break;
    }

    return '''
    <a href="${model.link}" style="
      display: inline-block;
      padding: 10px 20px;
      color: #$textColor;
      text-align: center;
      text-decoration: none;
      border-radius: ${model.borderRadius}px;
      $buttonStyle
    ">${model.text}</a>
    ''';
  }
}

enum ButtonStyles {
  text("Text", "text"),
  outlined("Outlined", "outlined"),
  filled("Filled", "filled");

  final String name;
  final String value;
  const ButtonStyles(this.name, this.value);
  static ButtonStyles fromString(String value) {
    return ButtonStyles.values.firstWhere((element) => element.value == value, orElse: () => ButtonStyles.filled);
  }
}
