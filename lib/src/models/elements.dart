// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:rubric/src/elements/box/box_model.dart';
import 'package:rubric/src/elements/elements.dart';
import 'package:rubric/src/elements/image/image_model.dart';
import 'package:rubric/src/elements/text/text_model.dart';
import 'package:rubric/src/elements/video/video_model.dart';

class ElementModel {
  final String id;
  ElementTypes type;
  double x;
  double y;
  double width;
  double height;
  Map<String, dynamic> properties;
  ElementModel({
    required this.id,
    required this.type,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    required this.properties,
  });

  T getProperties<T>() {
    return switch (type) {
          ElementTypes.box => BoxElementModel.fromJson(properties),
          ElementTypes.text => TextElementModel.fromJson(properties),
          ElementTypes.image => ImageElementModel.fromJson(properties),
          ElementTypes.video => VideoElementModel.fromJson(properties),
        }
        as T;
  }

  ElementModel copyWith({
    String? id,
    ElementTypes? type,
    double? x,
    double? y,
    double? width,
    double? height,
    Map<String, dynamic>? properties,
  }) {
    return ElementModel(
      id: id ?? this.id,
      type: type ?? this.type,
      x: x ?? this.x,
      y: y ?? this.y,
      width: width ?? this.width,
      height: height ?? this.height,
      properties: Map.from(properties ?? this.properties),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type.name,
      'x': x,
      'y': y,
      'width': width,
      'height': height,
      'properties': properties,
    };
  }

  factory ElementModel.fromMap(Map<String, dynamic> map) {
    return ElementModel(
      id: map['id'] as String,
      type: ElementTypes.fromName(map['type'] as String),
      x: map['x'] as double,
      y: map['y'] as double,
      width: map['width'] as double,
      height: map['height'] as double,
      properties: Map<String, dynamic>.from(
        (map['properties'] as Map<String, dynamic>),
      ),
    );
  }

  @override
  String toString() {
    return 'ElementModel(id: $id, type: $type, x: $x, y: $y, width: $width, height: $height, properties: $properties)';
  }

  @override
  bool operator ==(covariant ElementModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.type == type &&
        other.x == x &&
        other.y == y &&
        other.width == width &&
        other.height == height &&
        mapEquals(other.properties, properties);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        type.hashCode ^
        x.hashCode ^
        y.hashCode ^
        width.hashCode ^
        height.hashCode ^
        properties.hashCode;
  }
}
