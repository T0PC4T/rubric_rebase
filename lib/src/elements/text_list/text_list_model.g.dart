// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TextListElementModel _$TextListElementModelFromJson(
  Map<String, dynamic> json,
) => _TextListElementModel(
  textList: (json['textList'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  isBold: json['isBold'] as bool? ?? false,
  isItalic: json['isItalic'] as bool? ?? false,
  isUnderline: json['isUnderline'] ?? false,
  textListType:
      $enumDecodeNullable(_$TextListTypesEnumMap, json['textListType']) ??
      TextListTypes.bulleted,
  size: (json['size'] as num).toDouble(),
  color: colorFromJson((json['color'] as num).toInt()),
);

Map<String, dynamic> _$TextListElementModelToJson(
  _TextListElementModel instance,
) => <String, dynamic>{
  'textList': instance.textList,
  'isBold': instance.isBold,
  'isItalic': instance.isItalic,
  'isUnderline': ?instance.isUnderline,
  'textListType': _$TextListTypesEnumMap[instance.textListType]!,
  'size': instance.size,
  'color': ?colorToJson(instance.color),
};

const _$TextListTypesEnumMap = {
  TextListTypes.bulleted: 'bulleted',
  TextListTypes.numbered: 'numbered',
};
