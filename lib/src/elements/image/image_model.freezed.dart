// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ImageElementModel _$ImageElementModelFromJson(Map<String, dynamic> json) {
  return _ImageElementModel.fromJson(json);
}

/// @nodoc
mixin _$ImageElementModel {
  String get imageUrl => throw _privateConstructorUsedError;
  double get borderRadius => throw _privateConstructorUsedError;
  String get fit => throw _privateConstructorUsedError;
  double get aspectRatio => throw _privateConstructorUsedError;

  /// Serializes this ImageElementModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ImageElementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImageElementModelCopyWith<ImageElementModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageElementModelCopyWith<$Res> {
  factory $ImageElementModelCopyWith(
          ImageElementModel value, $Res Function(ImageElementModel) then) =
      _$ImageElementModelCopyWithImpl<$Res, ImageElementModel>;
  @useResult
  $Res call(
      {String imageUrl, double borderRadius, String fit, double aspectRatio});
}

/// @nodoc
class _$ImageElementModelCopyWithImpl<$Res, $Val extends ImageElementModel>
    implements $ImageElementModelCopyWith<$Res> {
  _$ImageElementModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImageElementModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = null,
    Object? borderRadius = null,
    Object? fit = null,
    Object? aspectRatio = null,
  }) {
    return _then(_value.copyWith(
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      borderRadius: null == borderRadius
          ? _value.borderRadius
          : borderRadius // ignore: cast_nullable_to_non_nullable
              as double,
      fit: null == fit
          ? _value.fit
          : fit // ignore: cast_nullable_to_non_nullable
              as String,
      aspectRatio: null == aspectRatio
          ? _value.aspectRatio
          : aspectRatio // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageElementModelImplCopyWith<$Res>
    implements $ImageElementModelCopyWith<$Res> {
  factory _$$ImageElementModelImplCopyWith(_$ImageElementModelImpl value,
          $Res Function(_$ImageElementModelImpl) then) =
      __$$ImageElementModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String imageUrl, double borderRadius, String fit, double aspectRatio});
}

/// @nodoc
class __$$ImageElementModelImplCopyWithImpl<$Res>
    extends _$ImageElementModelCopyWithImpl<$Res, _$ImageElementModelImpl>
    implements _$$ImageElementModelImplCopyWith<$Res> {
  __$$ImageElementModelImplCopyWithImpl(_$ImageElementModelImpl _value,
      $Res Function(_$ImageElementModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ImageElementModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = null,
    Object? borderRadius = null,
    Object? fit = null,
    Object? aspectRatio = null,
  }) {
    return _then(_$ImageElementModelImpl(
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      borderRadius: null == borderRadius
          ? _value.borderRadius
          : borderRadius // ignore: cast_nullable_to_non_nullable
              as double,
      fit: null == fit
          ? _value.fit
          : fit // ignore: cast_nullable_to_non_nullable
              as String,
      aspectRatio: null == aspectRatio
          ? _value.aspectRatio
          : aspectRatio // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$ImageElementModelImpl implements _ImageElementModel {
  const _$ImageElementModelImpl(
      {required this.imageUrl,
      this.borderRadius = 0,
      this.fit = ImageFits.contain,
      this.aspectRatio = AspectRatios.widescreen});

  factory _$ImageElementModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageElementModelImplFromJson(json);

  @override
  final String imageUrl;
  @override
  @JsonKey()
  final double borderRadius;
  @override
  @JsonKey()
  final String fit;
  @override
  @JsonKey()
  final double aspectRatio;

  @override
  String toString() {
    return 'ImageElementModel(imageUrl: $imageUrl, borderRadius: $borderRadius, fit: $fit, aspectRatio: $aspectRatio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageElementModelImpl &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.borderRadius, borderRadius) ||
                other.borderRadius == borderRadius) &&
            (identical(other.fit, fit) || other.fit == fit) &&
            (identical(other.aspectRatio, aspectRatio) ||
                other.aspectRatio == aspectRatio));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, imageUrl, borderRadius, fit, aspectRatio);

  /// Create a copy of ImageElementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageElementModelImplCopyWith<_$ImageElementModelImpl> get copyWith =>
      __$$ImageElementModelImplCopyWithImpl<_$ImageElementModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageElementModelImplToJson(
      this,
    );
  }
}

abstract class _ImageElementModel implements ImageElementModel {
  const factory _ImageElementModel(
      {required final String imageUrl,
      final double borderRadius,
      final String fit,
      final double aspectRatio}) = _$ImageElementModelImpl;

  factory _ImageElementModel.fromJson(Map<String, dynamic> json) =
      _$ImageElementModelImpl.fromJson;

  @override
  String get imageUrl;
  @override
  double get borderRadius;
  @override
  String get fit;
  @override
  double get aspectRatio;

  /// Create a copy of ImageElementModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImageElementModelImplCopyWith<_$ImageElementModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
