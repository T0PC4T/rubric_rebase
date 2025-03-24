import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_model.freezed.dart';
part 'image_model.g.dart';

@freezed
class ImageElementModel with _$ImageElementModel {
  @JsonSerializable()
  const factory ImageElementModel({
    required String imageUrl,
    required double borderRadius,
    required String fit,
  }) = _ImageElementModel;

  factory ImageElementModel.fromJson(Map<String, dynamic> json) =>
      _$ImageElementModelFromJson(json);
}
