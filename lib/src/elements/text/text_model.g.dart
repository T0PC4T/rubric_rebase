// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TextElementModelImpl _$$TextElementModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TextElementModelImpl(
      text: json['text'] as String,
      isBold: json['isBold'] as bool,
      size: (json['size'] as num).toDouble(),
      color: colorFromJson((json['color'] as num).toInt()),
    );

Map<String, dynamic> _$$TextElementModelImplToJson(
        _$TextElementModelImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'isBold': instance.isBold,
      'size': instance.size,
      'color': colorToJson(instance.color),
    };
