import 'package:freezed_annotation/freezed_annotation.dart';

part 'html_text_model.freezed.dart';
part 'html_text_model.g.dart';

enum HtmlTextAlign { left, center, right, justify }

@freezed
abstract class HtmlTextElementModel with _$HtmlTextElementModel {
  @JsonSerializable()
  const factory HtmlTextElementModel({required String text, @Default(HtmlTextAlign.left) HtmlTextAlign textAlign}) =
      _HtmlTextElementLementModel;

  factory HtmlTextElementModel.fromJson(Map<String, dynamic> json) => _$HtmlTextElementModelFromJson(json);

  static String toHTML(Map<String, dynamic> properties) {
    final model = HtmlTextElementModel.fromJson(properties);
    return model.text;
  }
}
