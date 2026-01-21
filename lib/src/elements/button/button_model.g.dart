// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'button_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ButtonElementModel _$ButtonElementModelFromJson(Map<String, dynamic> json) => _ButtonElementModel(
  text: json['text'] as String,
  style: json['style'] as String,
  link: json['link'] as String,
  borderRadius: (json['borderRadius'] as num).toDouble(),
  textColor: colorFromJson((json['textColor'] as num).toInt()),
  color: colorFromJson((json['color'] as num).toInt()),
);

Map<String, dynamic> _$ButtonElementModelToJson(_ButtonElementModel instance) => <String, dynamic>{
  'text': instance.text,
  'style': instance.style,
  'link': instance.link,
  'borderRadius': instance.borderRadius,
  'textColor': ?colorToJson(instance.textColor),
  'color': ?colorToJson(instance.color),
};
