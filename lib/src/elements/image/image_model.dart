import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rubric/src/elements/base/enums.dart';

part 'image_model.freezed.dart';
part 'image_model.g.dart';

@freezed
class ImageElementModel with _$ImageElementModel {
  @JsonSerializable()
  const factory ImageElementModel({
    required String imageUrl,
    @Default(0) double borderRadius,
    @Default(ImageFits.contain) String fit,
    @Default(AspectRatios.widescreen) double aspectRatio,
  }) = _ImageElementModel;

  factory ImageElementModel.fromJson(Map<String, dynamic> json) =>
      _$ImageElementModelFromJson(json);

  static String toHTML(Map<String, dynamic> properties) {
    final model = ImageElementModel.fromJson(properties);
    return '''
    <img src="${model.imageUrl}" style="
      width: 100%;
      height: auto;
      aspect-ratio: ${model.aspectRatio};
      object-fit: ${model.fit};
      border-radius: ${model.borderRadius}px;
    ">
    ''';
  }
}

abstract class ImageFits {
  static const cover = "cover";
  static const contain = "contain";
  static const fill = "fill";
  static const all = [cover, contain, fill];
}
