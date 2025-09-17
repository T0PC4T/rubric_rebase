import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/utilities/color.dart';

part 'row_model.freezed.dart';
part 'row_model.g.dart';

@freezed
abstract class RowElementModel with _$RowElementModel {
  const RowElementModel._();

  @JsonSerializable()
  const factory RowElementModel({
    @JsonKey(toJson: colorToJson, fromJson: colorFromJson) required Color color,
    required List<List<Map<String, dynamic>>> elements,
    required int columns,
  }) = _RowElementModel;

  factory RowElementModel.fromJson(Map<String, dynamic> json) =>
      _$RowElementModelFromJson(json);

  static String toHTML(Map<String, dynamic> properties) {
    final model = RowElementModel.fromJson(properties);
    String columnHtml = '';
    for (int i = 0; i < model.columns; i++) {
      String elementsHtml = '';
      for (var elementMap in model.elements[i]) {
        final element = ElementModel.fromMap(elementMap);
        elementsHtml += element.toHTML();
      }
      columnHtml +=
          '''
        <tr style="vertical-align: top; width: ${100 / model.columns}%;">
          $elementsHtml
        </tr>
      ''';
    }

    return '''
    <table style="width: 100%; border-collapse: collapse;">
        $columnHtml      
    </table>
    ''';
  }
}
