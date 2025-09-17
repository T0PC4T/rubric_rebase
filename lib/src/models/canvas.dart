// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rubric/src/elements/elements.dart';
import 'package:rubric/src/elements/row/row_model.dart';
import 'package:rubric/src/models/editor_models.dart';
import 'package:rubric/src/models/elements.dart';
import 'package:rubric/src/utilities/color.dart';

part 'canvas.freezed.dart';
part 'canvas.g.dart';

@freezed
abstract class CanvasSettings with _$CanvasSettings {
  const CanvasSettings._();

  @JsonSerializable()
  const factory CanvasSettings({
    required String name,
    @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
    required Color backgroundColor,
    @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
    required Color canvasColor,
    @Default(0) double spacing,
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
      spacing: GridSizes.defaultSpacing,
      name: "Untitled",
      icon: "doc",
      fontFamily: "Roboto",
    ),
  });

  ElementModel element(String id) {
    for (var element in elements) {
      if (element.type.category == ElementCategories.flex) {
        if (element.getProperties<RowElementModel>().elements.isNotEmpty) {
          for (var column
              in element.getProperties<RowElementModel>().elements) {
            for (var rowElement in column) {
              final el = ElementModel.fromMap(rowElement);
              if (el.id == id) {
                return el;
              }
            }
          }
        }
      }
      if (element.id == id) {
        return element;
      }
    }
    return elements.firstWhere((element) => element.id == id);
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

  String toHTML() {
    String html = "";
    for (var element in elements) {
      html += """<div class="element-padding">${element.toHTML()}</div>""";
    }
    return """
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${settings.name}</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #${colorToHex(settings.backgroundColor)};
            font-family: ${settings.fontFamily};
        }
        .canvas-container {
            max-width: 1000px;
            margin: 0 auto;
            background-color: #${colorToHex(settings.canvasColor)};
            padding: ${settings.spacing / 2}px;
        }
        .element-padding {
            padding: ${settings.spacing / 2}px;
        }
        /* Basic responsive adjustments */
        @media (max-width: 800px) {
            .canvas-container {
                max-width: 100%;
                padding: ${settings.spacing / 2}px;
            }
        }
    </style>
</head>
<body>
    <div class="canvas-container">
        $html
    </div>
</body>
</html>
    """;
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
}
