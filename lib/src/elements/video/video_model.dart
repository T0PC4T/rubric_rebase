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

  static String toHTML(Map<String, dynamic> properties) {
    final model = VideoElementModel.fromJson(properties);
    if (model.isYoutube) {
      return '''
    <iframe 
      width="100%" 
      height="315" 
      src="${model.videoUrl.replaceAll("watch?v=", "embed/")}" 
      frameborder="0" 
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
      allowfullscreen>
    </iframe>
    ''';
    } else {
      return '''
    <video width="100%" height="auto" controls>
      <source src="${model.videoUrl}" type="video/mp4">
      Your browser does not support the video tag.
    </video>
    ''';
    }
  }
}
