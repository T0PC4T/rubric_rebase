// import 'dart:convert';

// import 'package:flutter_quill/flutter_quill.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'rich_text_model.freezed.dart';
// part 'rich_text_model.g.dart';

// @freezed
// class RichTextElementModel with _$RichTextElementModel {
//   @JsonSerializable()
//   const factory RichTextElementModel({
//     @JsonKey(toJson: _documentToString, fromJson: _documentFromString)
//     required Document document,
//   }) = _RichTextElementModel;

//   factory RichTextElementModel.fromJson(Map<String, dynamic> json) =>
//       _$RichTextElementModelFromJson(json);
// }

// String _documentToString(Document document) {
//   return jsonEncode(document.toDelta().toJson());
// }

// Document _documentFromString(String value) {
//   if (value.isEmpty) {
//     return Document();
//   }
//   try {
//     return Document.fromJson(jsonDecode(value));
//   } catch (e) {
//     return Document();
//   }
// }
