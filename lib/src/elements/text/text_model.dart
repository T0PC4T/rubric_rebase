import 'dart:convert';

import 'package:flutter_quill/flutter_quill.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_model.freezed.dart';
part 'text_model.g.dart';

@freezed
class TextElementModel with _$TextElementModel {
  @JsonSerializable()
  const factory TextElementModel({
    @JsonKey(toJson: _documentToString, fromJson: _documentFromString)
    required Document document,
  }) = _TextElementModel;

  factory TextElementModel.fromJson(Map<String, dynamic> json) =>
      _$TextElementModelFromJson(json);
}

String _documentToString(Document document) {
  return jsonEncode(document.toDelta().toJson());
}

Document _documentFromString(String value) {
  if (value.isEmpty) {
    return Document();
  }
  try {
    return Document.fromJson(jsonDecode(value));
  } catch (e) {
    return Document();
  }
}
