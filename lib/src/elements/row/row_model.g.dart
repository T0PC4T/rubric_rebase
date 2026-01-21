// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'row_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RowElementModel _$RowElementModelFromJson(Map<String, dynamic> json) => _RowElementModel(
  color: colorFromJson((json['color'] as num).toInt()),
  elements: (json['elements'] as List<dynamic>)
      .map((e) => (e as List<dynamic>).map((e) => e as Map<String, dynamic>).toList())
      .toList(),
  columns: (json['columns'] as num).toInt(),
  crossAxisAlignment: json['crossAxisAlignment'] as String? ?? 'start',
);

Map<String, dynamic> _$RowElementModelToJson(_RowElementModel instance) => <String, dynamic>{
  'color': ?colorToJson(instance.color),
  'elements': instance.elements,
  'columns': instance.columns,
  'crossAxisAlignment': instance.crossAxisAlignment,
};
