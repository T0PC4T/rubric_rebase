import 'package:freezed_annotation/freezed_annotation.dart';

part 'pdf_model.freezed.dart';
part 'pdf_model.g.dart';

@freezed
abstract class PdfElementModel with _$PdfElementModel {
  const PdfElementModel._();

  @JsonSerializable()
  const factory PdfElementModel({
    required String pdfUrl,
  }) = _PdfElementModel;

  factory PdfElementModel.fromJson(Map<String, dynamic> json) =>
      _$PdfElementModelFromJson(json);

  static String toHTML(Map<String, dynamic> properties) {
    final model = PdfElementModel.fromJson(properties);
    return '''
    <iframe 
      width="100%" 
      height="500px" 
      src="${model.pdfUrl}" 
      frameborder="0" 
      allow="autoplay; encrypted-media;" 
      allowfullscreen>
    </iframe>
    ''';
  }
}
