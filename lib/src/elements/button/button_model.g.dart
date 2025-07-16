// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'button_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ButtonElementModelImpl _$$ButtonElementModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ButtonElementModelImpl(
      text: json['text'] as String,
      style: json['style'] as String,
      link: json['link'] as String,
      borderRadius: (json['borderRadius'] as num).toDouble(),
      textColor: colorFromJson((json['textColor'] as num).toInt()),
      color: colorFromJson((json['color'] as num).toInt()),
    );

Map<String, dynamic> _$$ButtonElementModelImplToJson(
        _$ButtonElementModelImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'style': instance.style,
      'link': instance.link,
      'borderRadius': instance.borderRadius,
      'textColor': colorToJson(instance.textColor),
      'color': colorToJson(instance.color),
    };
