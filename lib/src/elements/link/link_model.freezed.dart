// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'link_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LinkElementModel {

 String get text; bool get isBold; bool get isItalic; bool get isUnderline; String get alignment; double get size;@JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color get color; String get link;
/// Create a copy of LinkElementModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LinkElementModelCopyWith<LinkElementModel> get copyWith => _$LinkElementModelCopyWithImpl<LinkElementModel>(this as LinkElementModel, _$identity);

  /// Serializes this LinkElementModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LinkElementModel&&(identical(other.text, text) || other.text == text)&&(identical(other.isBold, isBold) || other.isBold == isBold)&&(identical(other.isItalic, isItalic) || other.isItalic == isItalic)&&(identical(other.isUnderline, isUnderline) || other.isUnderline == isUnderline)&&(identical(other.alignment, alignment) || other.alignment == alignment)&&(identical(other.size, size) || other.size == size)&&(identical(other.color, color) || other.color == color)&&(identical(other.link, link) || other.link == link));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,isBold,isItalic,isUnderline,alignment,size,color,link);

@override
String toString() {
  return 'LinkElementModel(text: $text, isBold: $isBold, isItalic: $isItalic, isUnderline: $isUnderline, alignment: $alignment, size: $size, color: $color, link: $link)';
}


}

/// @nodoc
abstract mixin class $LinkElementModelCopyWith<$Res>  {
  factory $LinkElementModelCopyWith(LinkElementModel value, $Res Function(LinkElementModel) _then) = _$LinkElementModelCopyWithImpl;
@useResult
$Res call({
 String text, bool isBold, bool isItalic, bool isUnderline, String alignment, double size,@JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color color, String link
});




}
/// @nodoc
class _$LinkElementModelCopyWithImpl<$Res>
    implements $LinkElementModelCopyWith<$Res> {
  _$LinkElementModelCopyWithImpl(this._self, this._then);

  final LinkElementModel _self;
  final $Res Function(LinkElementModel) _then;

/// Create a copy of LinkElementModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? isBold = null,Object? isItalic = null,Object? isUnderline = null,Object? alignment = null,Object? size = null,Object? color = null,Object? link = null,}) {
  return _then(_self.copyWith(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,isBold: null == isBold ? _self.isBold : isBold // ignore: cast_nullable_to_non_nullable
as bool,isItalic: null == isItalic ? _self.isItalic : isItalic // ignore: cast_nullable_to_non_nullable
as bool,isUnderline: null == isUnderline ? _self.isUnderline : isUnderline // ignore: cast_nullable_to_non_nullable
as bool,alignment: null == alignment ? _self.alignment : alignment // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as double,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LinkElementModel].
extension LinkElementModelPatterns on LinkElementModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LinkElementModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LinkElementModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LinkElementModel value)  $default,){
final _that = this;
switch (_that) {
case _LinkElementModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LinkElementModel value)?  $default,){
final _that = this;
switch (_that) {
case _LinkElementModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  bool isBold,  bool isItalic,  bool isUnderline,  String alignment,  double size, @JsonKey(toJson: colorToJson, fromJson: colorFromJson)  Color color,  String link)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LinkElementModel() when $default != null:
return $default(_that.text,_that.isBold,_that.isItalic,_that.isUnderline,_that.alignment,_that.size,_that.color,_that.link);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  bool isBold,  bool isItalic,  bool isUnderline,  String alignment,  double size, @JsonKey(toJson: colorToJson, fromJson: colorFromJson)  Color color,  String link)  $default,) {final _that = this;
switch (_that) {
case _LinkElementModel():
return $default(_that.text,_that.isBold,_that.isItalic,_that.isUnderline,_that.alignment,_that.size,_that.color,_that.link);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  bool isBold,  bool isItalic,  bool isUnderline,  String alignment,  double size, @JsonKey(toJson: colorToJson, fromJson: colorFromJson)  Color color,  String link)?  $default,) {final _that = this;
switch (_that) {
case _LinkElementModel() when $default != null:
return $default(_that.text,_that.isBold,_that.isItalic,_that.isUnderline,_that.alignment,_that.size,_that.color,_that.link);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable()
class _LinkElementModel extends LinkElementModel {
  const _LinkElementModel({required this.text, this.isBold = false, this.isItalic = false, this.isUnderline = true, this.alignment = ElementAlignment.left, required this.size, @JsonKey(toJson: colorToJson, fromJson: colorFromJson) required this.color, required this.link}): super._();
  factory _LinkElementModel.fromJson(Map<String, dynamic> json) => _$LinkElementModelFromJson(json);

@override final  String text;
@override@JsonKey() final  bool isBold;
@override@JsonKey() final  bool isItalic;
@override@JsonKey() final  bool isUnderline;
@override@JsonKey() final  String alignment;
@override final  double size;
@override@JsonKey(toJson: colorToJson, fromJson: colorFromJson) final  Color color;
@override final  String link;

/// Create a copy of LinkElementModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LinkElementModelCopyWith<_LinkElementModel> get copyWith => __$LinkElementModelCopyWithImpl<_LinkElementModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LinkElementModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LinkElementModel&&(identical(other.text, text) || other.text == text)&&(identical(other.isBold, isBold) || other.isBold == isBold)&&(identical(other.isItalic, isItalic) || other.isItalic == isItalic)&&(identical(other.isUnderline, isUnderline) || other.isUnderline == isUnderline)&&(identical(other.alignment, alignment) || other.alignment == alignment)&&(identical(other.size, size) || other.size == size)&&(identical(other.color, color) || other.color == color)&&(identical(other.link, link) || other.link == link));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,isBold,isItalic,isUnderline,alignment,size,color,link);

@override
String toString() {
  return 'LinkElementModel(text: $text, isBold: $isBold, isItalic: $isItalic, isUnderline: $isUnderline, alignment: $alignment, size: $size, color: $color, link: $link)';
}


}

/// @nodoc
abstract mixin class _$LinkElementModelCopyWith<$Res> implements $LinkElementModelCopyWith<$Res> {
  factory _$LinkElementModelCopyWith(_LinkElementModel value, $Res Function(_LinkElementModel) _then) = __$LinkElementModelCopyWithImpl;
@override @useResult
$Res call({
 String text, bool isBold, bool isItalic, bool isUnderline, String alignment, double size,@JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color color, String link
});




}
/// @nodoc
class __$LinkElementModelCopyWithImpl<$Res>
    implements _$LinkElementModelCopyWith<$Res> {
  __$LinkElementModelCopyWithImpl(this._self, this._then);

  final _LinkElementModel _self;
  final $Res Function(_LinkElementModel) _then;

/// Create a copy of LinkElementModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? isBold = null,Object? isItalic = null,Object? isUnderline = null,Object? alignment = null,Object? size = null,Object? color = null,Object? link = null,}) {
  return _then(_LinkElementModel(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,isBold: null == isBold ? _self.isBold : isBold // ignore: cast_nullable_to_non_nullable
as bool,isItalic: null == isItalic ? _self.isItalic : isItalic // ignore: cast_nullable_to_non_nullable
as bool,isUnderline: null == isUnderline ? _self.isUnderline : isUnderline // ignore: cast_nullable_to_non_nullable
as bool,alignment: null == alignment ? _self.alignment : alignment // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as double,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
