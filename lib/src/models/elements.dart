// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:rubric/src/elements/box/box_model.dart';
import 'package:rubric/src/elements/button/button_model.dart';
import 'package:rubric/src/elements/divider/divider_model.dart';
import 'package:rubric/src/elements/elements.dart';
import 'package:rubric/src/elements/image/image_model.dart';
import 'package:rubric/src/elements/link/link_model.dart';
import 'package:rubric/src/elements/row/row_model.dart';
import 'package:rubric/src/elements/text/text_model.dart';
import 'package:rubric/src/elements/text_list/text_list_model.dart';
import 'package:rubric/src/elements/video/video_model.dart';

class ElementModel {
  final String id;
  ElementType type;
  double padding;
  Map<String, dynamic> properties;

  ElementModel({
    required this.id,
    required this.type,
    required this.padding,
    required this.properties,
  });

  T getProperties<T>() {
    return switch (type) {
      ElementType.text => TextElementModel.fromJson(properties),
      ElementType.heading => TextElementModel.fromJson(properties),
      ElementType.textList => TextListElementModel.fromJson(properties),
      ElementType.link => LinkElementModel.fromJson(properties),
      ElementType.button => ButtonElementModel.fromJson(properties),
      ElementType.box => BoxElementModel.fromJson(properties),
      ElementType.row => RowElementModel.fromJson(properties),
      ElementType.image => ImageElementModel.fromJson(properties),
      ElementType.video => VideoElementModel.fromJson(properties),
      ElementType.divider => DividerElementModel.fromJson(properties),

      // ElementTypes.richtext => RichTextElementModel.fromJson(properties),
    } as T;
  }

  ElementModel copyWith({
    String? id,
    ElementType? type,
    double? padding,
    Map<String, dynamic>? properties,
  }) {
    return ElementModel(
      id: id ?? this.id,
      type: type ?? this.type,
      padding: padding ?? this.padding,
      properties: properties ?? this.properties,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type.name,
      'padding': padding,
      'properties': properties,
    };
  }

  String toHTML() {
    final html = switch (type) {
      ElementType.text => TextElementModel.toHTML(properties),
      ElementType.heading => TextElementModel.toHTML(properties),
      ElementType.textList => TextListElementModel.toHTML(properties),
      ElementType.link => LinkElementModel.toHTML(properties),
      ElementType.button => ButtonElementModel.toHTML(properties),
      ElementType.box => BoxElementModel.toHTML(properties),
      ElementType.row => RowElementModel.toHTML(properties),
      ElementType.image => ImageElementModel.toHTML(properties),
      ElementType.video => VideoElementModel.toHTML(properties),
      ElementType.divider => DividerElementModel.toHTML(properties),
    };
    // add padding
    return """<div style="padding: ${padding}px;">$html</div>""";
  }

  factory ElementModel.fromMap(Map<String, dynamic> map) {
    return ElementModel(
      id: map['id'] as String,
      type: ElementType.fromName(map["type"]),
      padding: map['padding'] as double,
      properties: Map<String, dynamic>.from(
          (map['properties'] as Map<String, dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory ElementModel.fromJson(String source) =>
      ElementModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ElementModel(id: $id, type: $type, padding: $padding, properties: $properties)';
  }

  @override
  bool operator ==(covariant ElementModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.type == type &&
        other.padding == padding &&
        mapEquals(other.properties, properties);
  }

  @override
  int get hashCode {
    return id.hashCode ^ type.hashCode ^ padding.hashCode ^ properties.hashCode;
  }
}
