// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VideoElementModel {

 String get videoUrl; bool get isYoutube;
/// Create a copy of VideoElementModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VideoElementModelCopyWith<VideoElementModel> get copyWith => _$VideoElementModelCopyWithImpl<VideoElementModel>(this as VideoElementModel, _$identity);

  /// Serializes this VideoElementModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoElementModel&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.isYoutube, isYoutube) || other.isYoutube == isYoutube));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,videoUrl,isYoutube);

@override
String toString() {
  return 'VideoElementModel(videoUrl: $videoUrl, isYoutube: $isYoutube)';
}


}

/// @nodoc
abstract mixin class $VideoElementModelCopyWith<$Res>  {
  factory $VideoElementModelCopyWith(VideoElementModel value, $Res Function(VideoElementModel) _then) = _$VideoElementModelCopyWithImpl;
@useResult
$Res call({
 String videoUrl, bool isYoutube
});




}
/// @nodoc
class _$VideoElementModelCopyWithImpl<$Res>
    implements $VideoElementModelCopyWith<$Res> {
  _$VideoElementModelCopyWithImpl(this._self, this._then);

  final VideoElementModel _self;
  final $Res Function(VideoElementModel) _then;

/// Create a copy of VideoElementModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? videoUrl = null,Object? isYoutube = null,}) {
  return _then(_self.copyWith(
videoUrl: null == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String,isYoutube: null == isYoutube ? _self.isYoutube : isYoutube // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [VideoElementModel].
extension VideoElementModelPatterns on VideoElementModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VideoElementModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VideoElementModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VideoElementModel value)  $default,){
final _that = this;
switch (_that) {
case _VideoElementModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VideoElementModel value)?  $default,){
final _that = this;
switch (_that) {
case _VideoElementModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String videoUrl,  bool isYoutube)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VideoElementModel() when $default != null:
return $default(_that.videoUrl,_that.isYoutube);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String videoUrl,  bool isYoutube)  $default,) {final _that = this;
switch (_that) {
case _VideoElementModel():
return $default(_that.videoUrl,_that.isYoutube);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String videoUrl,  bool isYoutube)?  $default,) {final _that = this;
switch (_that) {
case _VideoElementModel() when $default != null:
return $default(_that.videoUrl,_that.isYoutube);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable()
class _VideoElementModel extends VideoElementModel {
  const _VideoElementModel({required this.videoUrl, required this.isYoutube}): super._();
  factory _VideoElementModel.fromJson(Map<String, dynamic> json) => _$VideoElementModelFromJson(json);

@override final  String videoUrl;
@override final  bool isYoutube;

/// Create a copy of VideoElementModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VideoElementModelCopyWith<_VideoElementModel> get copyWith => __$VideoElementModelCopyWithImpl<_VideoElementModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VideoElementModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VideoElementModel&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.isYoutube, isYoutube) || other.isYoutube == isYoutube));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,videoUrl,isYoutube);

@override
String toString() {
  return 'VideoElementModel(videoUrl: $videoUrl, isYoutube: $isYoutube)';
}


}

/// @nodoc
abstract mixin class _$VideoElementModelCopyWith<$Res> implements $VideoElementModelCopyWith<$Res> {
  factory _$VideoElementModelCopyWith(_VideoElementModel value, $Res Function(_VideoElementModel) _then) = __$VideoElementModelCopyWithImpl;
@override @useResult
$Res call({
 String videoUrl, bool isYoutube
});




}
/// @nodoc
class __$VideoElementModelCopyWithImpl<$Res>
    implements _$VideoElementModelCopyWith<$Res> {
  __$VideoElementModelCopyWithImpl(this._self, this._then);

  final _VideoElementModel _self;
  final $Res Function(_VideoElementModel) _then;

/// Create a copy of VideoElementModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? videoUrl = null,Object? isYoutube = null,}) {
  return _then(_VideoElementModel(
videoUrl: null == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String,isYoutube: null == isYoutube ? _self.isYoutube : isYoutube // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
