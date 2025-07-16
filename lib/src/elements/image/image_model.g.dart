// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageElementModelImpl _$$ImageElementModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ImageElementModelImpl(
      imageUrl: json['imageUrl'] as String,
      borderRadius: (json['borderRadius'] as num?)?.toDouble() ?? 0,
      fit: json['fit'] as String? ?? ImageFits.contain,
      aspectRatio:
          (json['aspectRatio'] as num?)?.toDouble() ?? AspectRatios.widescreen,
    );

Map<String, dynamic> _$$ImageElementModelImplToJson(
        _$ImageElementModelImpl instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'borderRadius': instance.borderRadius,
      'fit': instance.fit,
      'aspectRatio': instance.aspectRatio,
    };
