// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'divider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DividerElementModel _$DividerElementModelFromJson(Map<String, dynamic> json) => _DividerElementModel(
  color: colorFromJson((json['color'] as num).toInt()),
  weight: (json['weight'] as num).toDouble(),
);

Map<String, dynamic> _$DividerElementModelToJson(_DividerElementModel instance) => <String, dynamic>{
  'color': ?colorToJson(instance.color),
  'weight': instance.weight,
};
