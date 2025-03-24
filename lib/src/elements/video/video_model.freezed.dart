// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VideoElementModel _$VideoElementModelFromJson(Map<String, dynamic> json) {
  return _VideoElementModel.fromJson(json);
}

/// @nodoc
mixin _$VideoElementModel {
  String get videoUrl => throw _privateConstructorUsedError;
  bool get isYoutube => throw _privateConstructorUsedError;

  /// Serializes this VideoElementModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VideoElementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VideoElementModelCopyWith<VideoElementModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoElementModelCopyWith<$Res> {
  factory $VideoElementModelCopyWith(
          VideoElementModel value, $Res Function(VideoElementModel) then) =
      _$VideoElementModelCopyWithImpl<$Res, VideoElementModel>;
  @useResult
  $Res call({String videoUrl, bool isYoutube});
}

/// @nodoc
class _$VideoElementModelCopyWithImpl<$Res, $Val extends VideoElementModel>
    implements $VideoElementModelCopyWith<$Res> {
  _$VideoElementModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VideoElementModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoUrl = null,
    Object? isYoutube = null,
  }) {
    return _then(_value.copyWith(
      videoUrl: null == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isYoutube: null == isYoutube
          ? _value.isYoutube
          : isYoutube // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoElementModelImplCopyWith<$Res>
    implements $VideoElementModelCopyWith<$Res> {
  factory _$$VideoElementModelImplCopyWith(_$VideoElementModelImpl value,
          $Res Function(_$VideoElementModelImpl) then) =
      __$$VideoElementModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String videoUrl, bool isYoutube});
}

/// @nodoc
class __$$VideoElementModelImplCopyWithImpl<$Res>
    extends _$VideoElementModelCopyWithImpl<$Res, _$VideoElementModelImpl>
    implements _$$VideoElementModelImplCopyWith<$Res> {
  __$$VideoElementModelImplCopyWithImpl(_$VideoElementModelImpl _value,
      $Res Function(_$VideoElementModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of VideoElementModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoUrl = null,
    Object? isYoutube = null,
  }) {
    return _then(_$VideoElementModelImpl(
      videoUrl: null == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isYoutube: null == isYoutube
          ? _value.isYoutube
          : isYoutube // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$VideoElementModelImpl implements _VideoElementModel {
  const _$VideoElementModelImpl(
      {required this.videoUrl, required this.isYoutube});

  factory _$VideoElementModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoElementModelImplFromJson(json);

  @override
  final String videoUrl;
  @override
  final bool isYoutube;

  @override
  String toString() {
    return 'VideoElementModel(videoUrl: $videoUrl, isYoutube: $isYoutube)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoElementModelImpl &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.isYoutube, isYoutube) ||
                other.isYoutube == isYoutube));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, videoUrl, isYoutube);

  /// Create a copy of VideoElementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoElementModelImplCopyWith<_$VideoElementModelImpl> get copyWith =>
      __$$VideoElementModelImplCopyWithImpl<_$VideoElementModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoElementModelImplToJson(
      this,
    );
  }
}

abstract class _VideoElementModel implements VideoElementModel {
  const factory _VideoElementModel(
      {required final String videoUrl,
      required final bool isYoutube}) = _$VideoElementModelImpl;

  factory _VideoElementModel.fromJson(Map<String, dynamic> json) =
      _$VideoElementModelImpl.fromJson;

  @override
  String get videoUrl;
  @override
  bool get isYoutube;

  /// Create a copy of VideoElementModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoElementModelImplCopyWith<_$VideoElementModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
