// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TextElementModel _$TextElementModelFromJson(Map<String, dynamic> json) =>
    _TextElementModel(
      text: json['text'] as String,
      isBold: json['isBold'] as bool? ?? false,
      isItalic: json['isItalic'] as bool? ?? false,
      isUnderline: json['isUnderline'] as bool? ?? false,
      alignment: json['alignment'] as String? ?? ElementAlignment.left,
      size: (json['size'] as num).toDouble(),
      color: colorFromJson((json['color'] as num).toInt()),
    );

Map<String, dynamic> _$TextElementModelToJson(_TextElementModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'isBold': instance.isBold,
      'isItalic': instance.isItalic,
      'isUnderline': instance.isUnderline,
      'alignment': instance.alignment,
      'size': instance.size,
      'color': ?colorToJson(instance.color),
    };
