// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ImageElementModel _$ImageElementModelFromJson(Map<String, dynamic> json) => _ImageElementModel(
  imageUrl: json['imageUrl'] as String,
  borderRadius: (json['borderRadius'] as num?)?.toDouble() ?? 0,
  fit: json['fit'] as String? ?? ImageFits.contain,
  aspectRatio: (json['aspectRatio'] as num?)?.toDouble() ?? AspectRatios.widescreen,
);

Map<String, dynamic> _$ImageElementModelToJson(_ImageElementModel instance) => <String, dynamic>{
  'imageUrl': instance.imageUrl,
  'borderRadius': instance.borderRadius,
  'fit': instance.fit,
  'aspectRatio': instance.aspectRatio,
};
