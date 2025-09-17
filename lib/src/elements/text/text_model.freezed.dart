// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TextElementModel {

 String get text; bool get isBold; bool get isItalic; bool get isUnderline; String get alignment; double get size;@JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color get color;
/// Create a copy of TextElementModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextElementModelCopyWith<TextElementModel> get copyWith => _$TextElementModelCopyWithImpl<TextElementModel>(this as TextElementModel, _$identity);

  /// Serializes this TextElementModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextElementModel&&(identical(other.text, text) || other.text == text)&&(identical(other.isBold, isBold) || other.isBold == isBold)&&(identical(other.isItalic, isItalic) || other.isItalic == isItalic)&&(identical(other.isUnderline, isUnderline) || other.isUnderline == isUnderline)&&(identical(other.alignment, alignment) || other.alignment == alignment)&&(identical(other.size, size) || other.size == size)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,isBold,isItalic,isUnderline,alignment,size,color);

@override
String toString() {
  return 'TextElementModel(text: $text, isBold: $isBold, isItalic: $isItalic, isUnderline: $isUnderline, alignment: $alignment, size: $size, color: $color)';
}


}

/// @nodoc
abstract mixin class $TextElementModelCopyWith<$Res>  {
  factory $TextElementModelCopyWith(TextElementModel value, $Res Function(TextElementModel) _then) = _$TextElementModelCopyWithImpl;
@useResult
$Res call({
 String text, bool isBold, bool isItalic, bool isUnderline, String alignment, double size,@JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color color
});




}
/// @nodoc
class _$TextElementModelCopyWithImpl<$Res>
    implements $TextElementModelCopyWith<$Res> {
  _$TextElementModelCopyWithImpl(this._self, this._then);

  final TextElementModel _self;
  final $Res Function(TextElementModel) _then;

/// Create a copy of TextElementModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? isBold = null,Object? isItalic = null,Object? isUnderline = null,Object? alignment = null,Object? size = null,Object? color = null,}) {
  return _then(_self.copyWith(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,isBold: null == isBold ? _self.isBold : isBold // ignore: cast_nullable_to_non_nullable
as bool,isItalic: null == isItalic ? _self.isItalic : isItalic // ignore: cast_nullable_to_non_nullable
as bool,isUnderline: null == isUnderline ? _self.isUnderline : isUnderline // ignore: cast_nullable_to_non_nullable
as bool,alignment: null == alignment ? _self.alignment : alignment // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as double,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}

}


/// Adds pattern-matching-related methods to [TextElementModel].
extension TextElementModelPatterns on TextElementModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TextElementModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TextElementModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TextElementModel value)  $default,){
final _that = this;
switch (_that) {
case _TextElementModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TextElementModel value)?  $default,){
final _that = this;
switch (_that) {
case _TextElementModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  bool isBold,  bool isItalic,  bool isUnderline,  String alignment,  double size, @JsonKey(toJson: colorToJson, fromJson: colorFromJson)  Color color)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TextElementModel() when $default != null:
return $default(_that.text,_that.isBold,_that.isItalic,_that.isUnderline,_that.alignment,_that.size,_that.color);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  bool isBold,  bool isItalic,  bool isUnderline,  String alignment,  double size, @JsonKey(toJson: colorToJson, fromJson: colorFromJson)  Color color)  $default,) {final _that = this;
switch (_that) {
case _TextElementModel():
return $default(_that.text,_that.isBold,_that.isItalic,_that.isUnderline,_that.alignment,_that.size,_that.color);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  bool isBold,  bool isItalic,  bool isUnderline,  String alignment,  double size, @JsonKey(toJson: colorToJson, fromJson: colorFromJson)  Color color)?  $default,) {final _that = this;
switch (_that) {
case _TextElementModel() when $default != null:
return $default(_that.text,_that.isBold,_that.isItalic,_that.isUnderline,_that.alignment,_that.size,_that.color);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable()
class _TextElementModel extends TextElementModel {
  const _TextElementModel({required this.text, this.isBold = false, this.isItalic = false, this.isUnderline = false, this.alignment = ElementAlignment.left, required this.size, @JsonKey(toJson: colorToJson, fromJson: colorFromJson) required this.color}): super._();
  factory _TextElementModel.fromJson(Map<String, dynamic> json) => _$TextElementModelFromJson(json);

@override final  String text;
@override@JsonKey() final  bool isBold;
@override@JsonKey() final  bool isItalic;
@override@JsonKey() final  bool isUnderline;
@override@JsonKey() final  String alignment;
@override final  double size;
@override@JsonKey(toJson: colorToJson, fromJson: colorFromJson) final  Color color;

/// Create a copy of TextElementModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TextElementModelCopyWith<_TextElementModel> get copyWith => __$TextElementModelCopyWithImpl<_TextElementModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TextElementModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TextElementModel&&(identical(other.text, text) || other.text == text)&&(identical(other.isBold, isBold) || other.isBold == isBold)&&(identical(other.isItalic, isItalic) || other.isItalic == isItalic)&&(identical(other.isUnderline, isUnderline) || other.isUnderline == isUnderline)&&(identical(other.alignment, alignment) || other.alignment == alignment)&&(identical(other.size, size) || other.size == size)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,isBold,isItalic,isUnderline,alignment,size,color);

@override
String toString() {
  return 'TextElementModel(text: $text, isBold: $isBold, isItalic: $isItalic, isUnderline: $isUnderline, alignment: $alignment, size: $size, color: $color)';
}


}

/// @nodoc
abstract mixin class _$TextElementModelCopyWith<$Res> implements $TextElementModelCopyWith<$Res> {
  factory _$TextElementModelCopyWith(_TextElementModel value, $Res Function(_TextElementModel) _then) = __$TextElementModelCopyWithImpl;
@override @useResult
$Res call({
 String text, bool isBold, bool isItalic, bool isUnderline, String alignment, double size,@JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color color
});




}
/// @nodoc
class __$TextElementModelCopyWithImpl<$Res>
    implements _$TextElementModelCopyWith<$Res> {
  __$TextElementModelCopyWithImpl(this._self, this._then);

  final _TextElementModel _self;
  final $Res Function(_TextElementModel) _then;

/// Create a copy of TextElementModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? isBold = null,Object? isItalic = null,Object? isUnderline = null,Object? alignment = null,Object? size = null,Object? color = null,}) {
  return _then(_TextElementModel(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,isBold: null == isBold ? _self.isBold : isBold // ignore: cast_nullable_to_non_nullable
as bool,isItalic: null == isItalic ? _self.isItalic : isItalic // ignore: cast_nullable_to_non_nullable
as bool,isUnderline: null == isUnderline ? _self.isUnderline : isUnderline // ignore: cast_nullable_to_non_nullable
as bool,alignment: null == alignment ? _self.alignment : alignment // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as double,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}

// dart format on
