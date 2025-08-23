import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rubric/src/utilities/color.dart';

part 'row_model.freezed.dart';
part 'row_model.g.dart';

@freezed
class RowElementModel with _$RowElementModel {
  @JsonSerializable()
  const factory RowElementModel({
    required List<List<Map<String, dynamic>>> elements,
    required int columns,
  }) = _RowElementModel;

  factory RowElementModel.fromJson(Map<String, dynamic> json) =>
      _$RowElementModelFromJson(json);
}
