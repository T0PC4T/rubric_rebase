// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VideoElementModel _$VideoElementModelFromJson(Map<String, dynamic> json) =>
    _VideoElementModel(
      videoUrl: json['videoUrl'] as String,
      isYoutube: json['isYoutube'] as bool,
    );

Map<String, dynamic> _$VideoElementModelToJson(_VideoElementModel instance) =>
    <String, dynamic>{
      'videoUrl': instance.videoUrl,
      'isYoutube': instance.isYoutube,
    };
