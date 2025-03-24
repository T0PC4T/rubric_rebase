// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TextElementModelImpl _$$TextElementModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TextElementModelImpl(
      document: _documentFromString(json['document'] as String),
    );

Map<String, dynamic> _$$TextElementModelImplToJson(
        _$TextElementModelImpl instance) =>
    <String, dynamic>{
      'document': _documentToString(instance.document),
    };
