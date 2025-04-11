// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rubric/src/models/editor_models.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/utilities/color.dart';

part 'canvas.freezed.dart';
part 'canvas.g.dart';

@freezed
class CanvasSettings with _$CanvasSettings {
  const factory CanvasSettings({
    required String name,
    @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
    required Color backgroundColor,
    @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
    required Color canvasColor,
    @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
    required Color gridColor,
    required GridSizes gridSize,
    required String fontFamily,
    required String icon,
  }) = _CanvasSettings;

  factory CanvasSettings.fromJson(Map<String, dynamic> json) =>
      _$CanvasSettingsFromJson(json);
}

class CanvasModel {
  List<ElementModel> elements;
  CanvasSettings settings;
  CanvasModel({
    this.elements = const [],
    this.settings = const CanvasSettings(
      backgroundColor: Color.fromARGB(255, 222, 222, 222),
      canvasColor: Color.fromARGB(255, 255, 255, 255),
      gridColor: Color.fromARGB(255, 238, 238, 238),
      gridSize: GridSizes.medium,
      name: "Untitled",
      icon: "doc",
      fontFamily: "Roboto",
    ),
  });

  ElementModel element(String id) {
    return elements.firstWhere(
      (element) => element.id == id,
    );
  }

  // ! DEEP COPY had to be manually implemented.
  CanvasModel copyWith({
    List<ElementModel>? elements,
    CanvasSettings? settings,
  }) {
    return CanvasModel(
      elements: (elements ?? this.elements)
          .map<ElementModel>((e) => e.copyWith())
          .toList(),
      settings: (settings ?? this.settings).copyWith(),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'elements': elements.map((x) => x.toMap()).toList(),
      'settings': settings.toJson(),
    };
  }

  factory CanvasModel.fromMap(Map<String, dynamic> map) {
    return CanvasModel(
      elements: List<ElementModel>.from(
        (map['elements'] as List<dynamic>).map<ElementModel>(
          (x) => ElementModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      settings: CanvasSettings.fromJson(
        map['settings'] as Map<String, dynamic>,
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CanvasModel.fromJson(String source) {
    return CanvasModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  @override
  String toString() => 'CanvasModel(elements: $elements, settings: $settings)';

  @override
  bool operator ==(covariant CanvasModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.elements, elements) && other.settings == settings;
  }

  @override
  int get hashCode => elements.hashCode ^ settings.hashCode;

  Iterable<ElementModel> get orderedElements {
    final es = List<ElementModel>.from(elements);
    es.sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
    return es;
  }
}
