// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ImageElementModel {

 String get imageUrl; double get borderRadius; String get fit; double get aspectRatio;
/// Create a copy of ImageElementModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageElementModelCopyWith<ImageElementModel> get copyWith => _$ImageElementModelCopyWithImpl<ImageElementModel>(this as ImageElementModel, _$identity);

  /// Serializes this ImageElementModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageElementModel&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.borderRadius, borderRadius) || other.borderRadius == borderRadius)&&(identical(other.fit, fit) || other.fit == fit)&&(identical(other.aspectRatio, aspectRatio) || other.aspectRatio == aspectRatio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,imageUrl,borderRadius,fit,aspectRatio);

@override
String toString() {
  return 'ImageElementModel(imageUrl: $imageUrl, borderRadius: $borderRadius, fit: $fit, aspectRatio: $aspectRatio)';
}


}

/// @nodoc
abstract mixin class $ImageElementModelCopyWith<$Res>  {
  factory $ImageElementModelCopyWith(ImageElementModel value, $Res Function(ImageElementModel) _then) = _$ImageElementModelCopyWithImpl;
@useResult
$Res call({
 String imageUrl, double borderRadius, String fit, double aspectRatio
});




}
/// @nodoc
class _$ImageElementModelCopyWithImpl<$Res>
    implements $ImageElementModelCopyWith<$Res> {
  _$ImageElementModelCopyWithImpl(this._self, this._then);

  final ImageElementModel _self;
  final $Res Function(ImageElementModel) _then;

/// Create a copy of ImageElementModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? imageUrl = null,Object? borderRadius = null,Object? fit = null,Object? aspectRatio = null,}) {
  return _then(_self.copyWith(
imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,borderRadius: null == borderRadius ? _self.borderRadius : borderRadius // ignore: cast_nullable_to_non_nullable
as double,fit: null == fit ? _self.fit : fit // ignore: cast_nullable_to_non_nullable
as String,aspectRatio: null == aspectRatio ? _self.aspectRatio : aspectRatio // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ImageElementModel].
extension ImageElementModelPatterns on ImageElementModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImageElementModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImageElementModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImageElementModel value)  $default,){
final _that = this;
switch (_that) {
case _ImageElementModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImageElementModel value)?  $default,){
final _that = this;
switch (_that) {
case _ImageElementModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String imageUrl,  double borderRadius,  String fit,  double aspectRatio)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImageElementModel() when $default != null:
return $default(_that.imageUrl,_that.borderRadius,_that.fit,_that.aspectRatio);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String imageUrl,  double borderRadius,  String fit,  double aspectRatio)  $default,) {final _that = this;
switch (_that) {
case _ImageElementModel():
return $default(_that.imageUrl,_that.borderRadius,_that.fit,_that.aspectRatio);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String imageUrl,  double borderRadius,  String fit,  double aspectRatio)?  $default,) {final _that = this;
switch (_that) {
case _ImageElementModel() when $default != null:
return $default(_that.imageUrl,_that.borderRadius,_that.fit,_that.aspectRatio);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable()
class _ImageElementModel extends ImageElementModel {
  const _ImageElementModel({required this.imageUrl, this.borderRadius = 0, this.fit = ImageFits.contain, this.aspectRatio = AspectRatios.widescreen}): super._();
  factory _ImageElementModel.fromJson(Map<String, dynamic> json) => _$ImageElementModelFromJson(json);

@override final  String imageUrl;
@override@JsonKey() final  double borderRadius;
@override@JsonKey() final  String fit;
@override@JsonKey() final  double aspectRatio;

/// Create a copy of ImageElementModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageElementModelCopyWith<_ImageElementModel> get copyWith => __$ImageElementModelCopyWithImpl<_ImageElementModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImageElementModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageElementModel&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.borderRadius, borderRadius) || other.borderRadius == borderRadius)&&(identical(other.fit, fit) || other.fit == fit)&&(identical(other.aspectRatio, aspectRatio) || other.aspectRatio == aspectRatio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,imageUrl,borderRadius,fit,aspectRatio);

@override
String toString() {
  return 'ImageElementModel(imageUrl: $imageUrl, borderRadius: $borderRadius, fit: $fit, aspectRatio: $aspectRatio)';
}


}

/// @nodoc
abstract mixin class _$ImageElementModelCopyWith<$Res> implements $ImageElementModelCopyWith<$Res> {
  factory _$ImageElementModelCopyWith(_ImageElementModel value, $Res Function(_ImageElementModel) _then) = __$ImageElementModelCopyWithImpl;
@override @useResult
$Res call({
 String imageUrl, double borderRadius, String fit, double aspectRatio
});




}
/// @nodoc
class __$ImageElementModelCopyWithImpl<$Res>
    implements _$ImageElementModelCopyWith<$Res> {
  __$ImageElementModelCopyWithImpl(this._self, this._then);

  final _ImageElementModel _self;
  final $Res Function(_ImageElementModel) _then;

/// Create a copy of ImageElementModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? imageUrl = null,Object? borderRadius = null,Object? fit = null,Object? aspectRatio = null,}) {
  return _then(_ImageElementModel(
imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,borderRadius: null == borderRadius ? _self.borderRadius : borderRadius // ignore: cast_nullable_to_non_nullable
as double,fit: null == fit ? _self.fit : fit // ignore: cast_nullable_to_non_nullable
as String,aspectRatio: null == aspectRatio ? _self.aspectRatio : aspectRatio // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
