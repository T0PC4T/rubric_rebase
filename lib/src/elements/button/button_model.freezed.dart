// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'button_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ButtonElementModel {

 String get text; String get style; String get link; double get borderRadius;@JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color get textColor;@JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color get color;
/// Create a copy of ButtonElementModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ButtonElementModelCopyWith<ButtonElementModel> get copyWith => _$ButtonElementModelCopyWithImpl<ButtonElementModel>(this as ButtonElementModel, _$identity);

  /// Serializes this ButtonElementModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ButtonElementModel&&(identical(other.text, text) || other.text == text)&&(identical(other.style, style) || other.style == style)&&(identical(other.link, link) || other.link == link)&&(identical(other.borderRadius, borderRadius) || other.borderRadius == borderRadius)&&(identical(other.textColor, textColor) || other.textColor == textColor)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,style,link,borderRadius,textColor,color);

@override
String toString() {
  return 'ButtonElementModel(text: $text, style: $style, link: $link, borderRadius: $borderRadius, textColor: $textColor, color: $color)';
}


}

/// @nodoc
abstract mixin class $ButtonElementModelCopyWith<$Res>  {
  factory $ButtonElementModelCopyWith(ButtonElementModel value, $Res Function(ButtonElementModel) _then) = _$ButtonElementModelCopyWithImpl;
@useResult
$Res call({
 String text, String style, String link, double borderRadius,@JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color textColor,@JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color color
});




}
/// @nodoc
class _$ButtonElementModelCopyWithImpl<$Res>
    implements $ButtonElementModelCopyWith<$Res> {
  _$ButtonElementModelCopyWithImpl(this._self, this._then);

  final ButtonElementModel _self;
  final $Res Function(ButtonElementModel) _then;

/// Create a copy of ButtonElementModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? style = null,Object? link = null,Object? borderRadius = null,Object? textColor = null,Object? color = null,}) {
  return _then(_self.copyWith(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,borderRadius: null == borderRadius ? _self.borderRadius : borderRadius // ignore: cast_nullable_to_non_nullable
as double,textColor: null == textColor ? _self.textColor : textColor // ignore: cast_nullable_to_non_nullable
as Color,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}

}


/// Adds pattern-matching-related methods to [ButtonElementModel].
extension ButtonElementModelPatterns on ButtonElementModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ButtonElementModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ButtonElementModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ButtonElementModel value)  $default,){
final _that = this;
switch (_that) {
case _ButtonElementModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ButtonElementModel value)?  $default,){
final _that = this;
switch (_that) {
case _ButtonElementModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  String style,  String link,  double borderRadius, @JsonKey(toJson: colorToJson, fromJson: colorFromJson)  Color textColor, @JsonKey(toJson: colorToJson, fromJson: colorFromJson)  Color color)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ButtonElementModel() when $default != null:
return $default(_that.text,_that.style,_that.link,_that.borderRadius,_that.textColor,_that.color);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  String style,  String link,  double borderRadius, @JsonKey(toJson: colorToJson, fromJson: colorFromJson)  Color textColor, @JsonKey(toJson: colorToJson, fromJson: colorFromJson)  Color color)  $default,) {final _that = this;
switch (_that) {
case _ButtonElementModel():
return $default(_that.text,_that.style,_that.link,_that.borderRadius,_that.textColor,_that.color);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  String style,  String link,  double borderRadius, @JsonKey(toJson: colorToJson, fromJson: colorFromJson)  Color textColor, @JsonKey(toJson: colorToJson, fromJson: colorFromJson)  Color color)?  $default,) {final _that = this;
switch (_that) {
case _ButtonElementModel() when $default != null:
return $default(_that.text,_that.style,_that.link,_that.borderRadius,_that.textColor,_that.color);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable()
class _ButtonElementModel extends ButtonElementModel {
  const _ButtonElementModel({required this.text, required this.style, required this.link, required this.borderRadius, @JsonKey(toJson: colorToJson, fromJson: colorFromJson) required this.textColor, @JsonKey(toJson: colorToJson, fromJson: colorFromJson) required this.color}): super._();
  factory _ButtonElementModel.fromJson(Map<String, dynamic> json) => _$ButtonElementModelFromJson(json);

@override final  String text;
@override final  String style;
@override final  String link;
@override final  double borderRadius;
@override@JsonKey(toJson: colorToJson, fromJson: colorFromJson) final  Color textColor;
@override@JsonKey(toJson: colorToJson, fromJson: colorFromJson) final  Color color;

/// Create a copy of ButtonElementModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ButtonElementModelCopyWith<_ButtonElementModel> get copyWith => __$ButtonElementModelCopyWithImpl<_ButtonElementModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ButtonElementModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ButtonElementModel&&(identical(other.text, text) || other.text == text)&&(identical(other.style, style) || other.style == style)&&(identical(other.link, link) || other.link == link)&&(identical(other.borderRadius, borderRadius) || other.borderRadius == borderRadius)&&(identical(other.textColor, textColor) || other.textColor == textColor)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,style,link,borderRadius,textColor,color);

@override
String toString() {
  return 'ButtonElementModel(text: $text, style: $style, link: $link, borderRadius: $borderRadius, textColor: $textColor, color: $color)';
}


}

/// @nodoc
abstract mixin class _$ButtonElementModelCopyWith<$Res> implements $ButtonElementModelCopyWith<$Res> {
  factory _$ButtonElementModelCopyWith(_ButtonElementModel value, $Res Function(_ButtonElementModel) _then) = __$ButtonElementModelCopyWithImpl;
@override @useResult
$Res call({
 String text, String style, String link, double borderRadius,@JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color textColor,@JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color color
});




}
/// @nodoc
class __$ButtonElementModelCopyWithImpl<$Res>
    implements _$ButtonElementModelCopyWith<$Res> {
  __$ButtonElementModelCopyWithImpl(this._self, this._then);

  final _ButtonElementModel _self;
  final $Res Function(_ButtonElementModel) _then;

/// Create a copy of ButtonElementModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? style = null,Object? link = null,Object? borderRadius = null,Object? textColor = null,Object? color = null,}) {
  return _then(_ButtonElementModel(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,borderRadius: null == borderRadius ? _self.borderRadius : borderRadius // ignore: cast_nullable_to_non_nullable
as double,textColor: null == textColor ? _self.textColor : textColor // ignore: cast_nullable_to_non_nullable
as Color,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}

// dart format on
