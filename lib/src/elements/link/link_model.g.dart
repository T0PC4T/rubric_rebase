// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LinkElementModelImpl _$$LinkElementModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LinkElementModelImpl(
      text: json['text'] as String,
      isBold: json['isBold'] as bool? ?? false,
      isItalic: json['isItalic'] as bool? ?? false,
      isUnderline: json['isUnderline'] as bool? ?? false,
      alignment: json['alignment'] as String? ?? ElementAlignment.left,
      size: (json['size'] as num).toDouble(),
      color: colorFromJson((json['color'] as num).toInt()),
      link: json['link'] as String,
    );

Map<String, dynamic> _$$LinkElementModelImplToJson(
        _$LinkElementModelImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'isBold': instance.isBold,
      'isItalic': instance.isItalic,
      'isUnderline': instance.isUnderline,
      'alignment': instance.alignment,
      'size': instance.size,
      'color': colorToJson(instance.color),
      'link': instance.link,
    };
