// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:rubric/src/elements/box/box_model.dart';
import 'package:rubric/src/elements/button/button_model.dart';
import 'package:rubric/src/elements/divider/divider_model.dart';
import 'package:rubric/src/elements/elements.dart';
import 'package:rubric/src/elements/image/image_model.dart';
import 'package:rubric/src/elements/link/link_model.dart';
import 'package:rubric/src/elements/text/text_model.dart';
import 'package:rubric/src/elements/text_list/text_list_model.dart';
import 'package:rubric/src/elements/video/video_model.dart';
import 'package:rubric/src/rubric_editor/models/preview.dart';

class ElementModel {
  final String id;
  ElementTypes type;
  double x;
  double y;
  double width;
  double height;
  double mobileX;
  double mobileY;
  double mobileWidth;
  double mobileHeight;
  bool get fixed => fixedWidth > 0;
  double fixedWidth;
  double padding;
  int orderIndex;

  Map<String, dynamic> properties;
  ElementModel({
    required this.id,
    required this.type,
    required this.padding,
    required this.orderIndex,
    required this.properties,
    this.fixedWidth = 1,
    this.x = 0,
    this.y = 0,
    this.width = 0,
    this.height = 0,
    this.mobileX = 0,
    this.mobileY = 0,
    this.mobileWidth = 0,
    this.mobileHeight = 0,
  });

  double getX(ViewModes viewMode) {
    return viewMode == ViewModes.desktop
        ? x * ViewModes.desktop.width
        : mobileX * ViewModes.mobile.width;
  }

  double getY(ViewModes viewMode) {
    return viewMode == ViewModes.desktop
        ? y * ViewModes.desktop.width
        : mobileY * ViewModes.mobile.width;
  }

  double getWidth(ViewModes viewMode) {
    return viewMode == ViewModes.desktop
        ? width * ViewModes.desktop.width
        : mobileWidth * ViewModes.mobile.width;
  }

  double getHeight(ViewModes viewMode) {
    return viewMode == ViewModes.desktop
        ? height * ViewModes.desktop.width
        : mobileHeight * ViewModes.mobile.width;
  }

  T getProperties<T>() {
    return switch (type) {
      ElementTypes.text => TextElementModel.fromJson(properties),
      ElementTypes.heading => TextElementModel.fromJson(properties),
      ElementTypes.textList => TextListElementModel.fromJson(properties),
      ElementTypes.link => LinkElementModel.fromJson(properties),
      ElementTypes.button => ButtonElementModel.fromJson(properties),
      ElementTypes.box => BoxElementModel.fromJson(properties),
      ElementTypes.image => ImageElementModel.fromJson(properties),
      ElementTypes.video => VideoElementModel.fromJson(properties),
      ElementTypes.divider => DividerElementModel.fromJson(properties),

      // ElementTypes.richtext => RichTextElementModel.fromJson(properties),
    } as T;
  }

  ElementModel copyWith({
    String? id,
    ElementTypes? type,
    double? x,
    double? y,
    double? width,
    double? height,
    double? mobileX,
    double? mobileY,
    double? mobileWidth,
    double? mobileHeight,
    double? fixedWidth,
    double? padding,
    int? orderIndex,
    Map<String, dynamic>? properties,
  }) {
    return ElementModel(
      id: id ?? this.id,
      type: type ?? this.type,
      x: x ?? this.x,
      y: y ?? this.y,
      width: width ?? this.width,
      height: height ?? this.height,
      mobileX: mobileX ?? this.mobileX,
      mobileY: mobileY ?? this.mobileY,
      mobileWidth: mobileWidth ?? this.mobileWidth,
      mobileHeight: mobileHeight ?? this.mobileHeight,
      fixedWidth: fixedWidth ?? this.fixedWidth,
      padding: padding ?? this.padding,
      orderIndex: orderIndex ?? this.orderIndex,
      properties: properties ?? this.properties,
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
      'mobileX': mobileX,
      'mobileY': mobileY,
      'mobileWidth': mobileWidth,
      'mobileHeight': mobileHeight,
      'fixedWidth': fixedWidth,
      'padding': padding,
      'orderIndex': orderIndex,
      'properties': properties,
    };
  }

  factory ElementModel.fromMap(Map<String, dynamic> map) {
    return ElementModel(
      id: map['id'] as String,
      type: ElementTypes.fromName(map['type']),
      x: map['x'] as double,
      y: map['y'] as double,
      width: map['width'] as double,
      height: map['height'] as double,
      mobileX: map['mobileX'] as double,
      mobileY: map['mobileY'] as double,
      mobileWidth: map['mobileWidth'] as double,
      mobileHeight: map['mobileHeight'] as double,
      fixedWidth: map['fixedWidth'] as double,
      padding: map['padding'] as double,
      orderIndex: map['orderIndex'] as int,
      properties: Map<String, dynamic>.from(
        (map['properties']),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ElementModel.fromJson(String source) =>
      ElementModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ElementModel(id: $id, type: $type, x: $x, y: $y, width: $width, height: $height, mobileX: $mobileX, mobileY: $mobileY, mobileWidth: $mobileWidth, mobileHeight: $mobileHeight, fixedWidth: $fixedWidth, padding: $padding, orderIndex: $orderIndex, properties: $properties)';
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
        other.mobileX == mobileX &&
        other.mobileY == mobileY &&
        other.mobileWidth == mobileWidth &&
        other.mobileHeight == mobileHeight &&
        other.fixedWidth == fixedWidth &&
        other.padding == padding &&
        other.orderIndex == orderIndex &&
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
        mobileX.hashCode ^
        mobileY.hashCode ^
        mobileWidth.hashCode ^
        mobileHeight.hashCode ^
        fixedWidth.hashCode ^
        padding.hashCode ^
        orderIndex.hashCode ^
        properties.hashCode;
  }
}
