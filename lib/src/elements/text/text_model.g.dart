// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TextElementModelImpl _$$TextElementModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TextElementModelImpl(
      text: json['text'] as String,
      isBold: json['isBold'] as bool? ?? false,
      isItalic: json['isItalic'] as bool? ?? false,
      isUnderline: json['isUnderline'] ?? false,
      alignment: json['alignment'] as String? ?? ElementAlignment.left,
      size: (json['size'] as num).toDouble(),
      color: colorFromJson((json['color'] as num).toInt()),
    );

Map<String, dynamic> _$$TextElementModelImplToJson(
        _$TextElementModelImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'isBold': instance.isBold,
      'isItalic': instance.isItalic,
      'isUnderline': instance.isUnderline,
      'alignment': instance.alignment,
      'size': instance.size,
      'color': colorToJson(instance.color),
    };
