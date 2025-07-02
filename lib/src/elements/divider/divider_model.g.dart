// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'divider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DividerElementModelImpl _$$DividerElementModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DividerElementModelImpl(
      color: colorFromJson((json['color'] as num).toInt()),
      weight: (json['weight'] as num).toDouble(),
    );

Map<String, dynamic> _$$DividerElementModelImplToJson(
        _$DividerElementModelImpl instance) =>
    <String, dynamic>{
      'color': colorToJson(instance.color),
      'weight': instance.weight,
    };
