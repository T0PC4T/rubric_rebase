// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'canvas.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CanvasSettingsImpl _$$CanvasSettingsImplFromJson(Map<String, dynamic> json) =>
    _$CanvasSettingsImpl(
      name: json['name'] as String,
      backgroundColor: colorFromJson((json['backgroundColor'] as num).toInt()),
      canvasColor: colorFromJson((json['canvasColor'] as num).toInt()),
      gridColor: colorFromJson((json['gridColor'] as num).toInt()),
      gridSize: $enumDecode(_$GridSizesEnumMap, json['gridSize']),
      fontFamily: json['fontFamily'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$$CanvasSettingsImplToJson(
        _$CanvasSettingsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'backgroundColor': colorToJson(instance.backgroundColor),
      'canvasColor': colorToJson(instance.canvasColor),
      'gridColor': colorToJson(instance.gridColor),
      'gridSize': _$GridSizesEnumMap[instance.gridSize]!,
      'fontFamily': instance.fontFamily,
      'icon': instance.icon,
    };

const _$GridSizesEnumMap = {
  GridSizes.none: 'none',
  GridSizes.small: 'small',
  GridSizes.medium: 'medium',
  GridSizes.large: 'large',
};
