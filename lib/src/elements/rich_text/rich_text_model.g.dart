// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rich_text_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RichTextElementModelImpl _$$RichTextElementModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RichTextElementModelImpl(
      document: _documentFromString(json['document'] as String),
    );

Map<String, dynamic> _$$RichTextElementModelImplToJson(
        _$RichTextElementModelImpl instance) =>
    <String, dynamic>{
      'document': _documentToString(instance.document),
    };
