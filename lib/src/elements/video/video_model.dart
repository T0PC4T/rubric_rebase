import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_model.freezed.dart';
part 'video_model.g.dart';

@freezed
class VideoElementModel with _$VideoElementModel {
  @JsonSerializable()
  const factory VideoElementModel({
    required String videoUrl,
    required bool isYoutube,
  }) = _VideoElementModel;

  factory VideoElementModel.fromJson(Map<String, dynamic> json) =>
      _$VideoElementModelFromJson(json);
}
