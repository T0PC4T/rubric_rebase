// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'row_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RowElementModelImpl _$$RowElementModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RowElementModelImpl(
      elements: (json['elements'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList())
          .toList(),
      columns: (json['columns'] as num).toInt(),
    );

Map<String, dynamic> _$$RowElementModelImplToJson(
        _$RowElementModelImpl instance) =>
    <String, dynamic>{
      'elements': instance.elements,
      'columns': instance.columns,
    };
