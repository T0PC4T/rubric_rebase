// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'box_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BoxElementModelImpl _$$BoxElementModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BoxElementModelImpl(
      color: colorFromJson((json['color'] as num).toInt()),
      borderRadius: (json['borderRadius'] as num).toDouble(),
      aspectRatio: (json['aspectRatio'] as num).toDouble(),
    );

Map<String, dynamic> _$$BoxElementModelImplToJson(
        _$BoxElementModelImpl instance) =>
    <String, dynamic>{
      'color': colorToJson(instance.color),
      'borderRadius': instance.borderRadius,
      'aspectRatio': instance.aspectRatio,
    };
