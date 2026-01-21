// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'html_text_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HtmlTextElementLementModel _$HtmlTextElementLementModelFromJson(Map<String, dynamic> json) =>
    _HtmlTextElementLementModel(
      text: json['text'] as String,
      textAlign: $enumDecodeNullable(_$HtmlTextAlignEnumMap, json['textAlign']) ?? HtmlTextAlign.left,
    );

Map<String, dynamic> _$HtmlTextElementLementModelToJson(_HtmlTextElementLementModel instance) => <String, dynamic>{
  'text': instance.text,
  'textAlign': _$HtmlTextAlignEnumMap[instance.textAlign]!,
};

const _$HtmlTextAlignEnumMap = {
  HtmlTextAlign.left: 'left',
  HtmlTextAlign.center: 'center',
  HtmlTextAlign.right: 'right',
  HtmlTextAlign.justify: 'justify',
};
