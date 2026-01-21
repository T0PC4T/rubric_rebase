// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'html_text_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
HtmlTextElementModel _$HtmlTextElementModelFromJson(
  Map<String, dynamic> json
) {
    return _HtmlTextElementLementModel.fromJson(
      json
    );
}

/// @nodoc
mixin _$HtmlTextElementModel {

 String get text; HtmlTextAlign get textAlign;
/// Create a copy of HtmlTextElementModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HtmlTextElementModelCopyWith<HtmlTextElementModel> get copyWith => _$HtmlTextElementModelCopyWithImpl<HtmlTextElementModel>(this as HtmlTextElementModel, _$identity);

  /// Serializes this HtmlTextElementModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HtmlTextElementModel&&(identical(other.text, text) || other.text == text)&&(identical(other.textAlign, textAlign) || other.textAlign == textAlign));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,textAlign);

@override
String toString() {
  return 'HtmlTextElementModel(text: $text, textAlign: $textAlign)';
}


}

/// @nodoc
abstract mixin class $HtmlTextElementModelCopyWith<$Res>  {
  factory $HtmlTextElementModelCopyWith(HtmlTextElementModel value, $Res Function(HtmlTextElementModel) _then) = _$HtmlTextElementModelCopyWithImpl;
@useResult
$Res call({
 String text, HtmlTextAlign textAlign
});




}
/// @nodoc
class _$HtmlTextElementModelCopyWithImpl<$Res>
    implements $HtmlTextElementModelCopyWith<$Res> {
  _$HtmlTextElementModelCopyWithImpl(this._self, this._then);

  final HtmlTextElementModel _self;
  final $Res Function(HtmlTextElementModel) _then;

/// Create a copy of HtmlTextElementModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? textAlign = null,}) {
  return _then(_self.copyWith(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,textAlign: null == textAlign ? _self.textAlign : textAlign // ignore: cast_nullable_to_non_nullable
as HtmlTextAlign,
  ));
}

}


/// Adds pattern-matching-related methods to [HtmlTextElementModel].
extension HtmlTextElementModelPatterns on HtmlTextElementModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HtmlTextElementLementModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HtmlTextElementLementModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HtmlTextElementLementModel value)  $default,){
final _that = this;
switch (_that) {
case _HtmlTextElementLementModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HtmlTextElementLementModel value)?  $default,){
final _that = this;
switch (_that) {
case _HtmlTextElementLementModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  HtmlTextAlign textAlign)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HtmlTextElementLementModel() when $default != null:
return $default(_that.text,_that.textAlign);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  HtmlTextAlign textAlign)  $default,) {final _that = this;
switch (_that) {
case _HtmlTextElementLementModel():
return $default(_that.text,_that.textAlign);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  HtmlTextAlign textAlign)?  $default,) {final _that = this;
switch (_that) {
case _HtmlTextElementLementModel() when $default != null:
return $default(_that.text,_that.textAlign);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable()
class _HtmlTextElementLementModel implements HtmlTextElementModel {
  const _HtmlTextElementLementModel({required this.text, this.textAlign = HtmlTextAlign.left});
  factory _HtmlTextElementLementModel.fromJson(Map<String, dynamic> json) => _$HtmlTextElementLementModelFromJson(json);

@override final  String text;
@override@JsonKey() final  HtmlTextAlign textAlign;

/// Create a copy of HtmlTextElementModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HtmlTextElementLementModelCopyWith<_HtmlTextElementLementModel> get copyWith => __$HtmlTextElementLementModelCopyWithImpl<_HtmlTextElementLementModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HtmlTextElementLementModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HtmlTextElementLementModel&&(identical(other.text, text) || other.text == text)&&(identical(other.textAlign, textAlign) || other.textAlign == textAlign));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,textAlign);

@override
String toString() {
  return 'HtmlTextElementModel(text: $text, textAlign: $textAlign)';
}


}

/// @nodoc
abstract mixin class _$HtmlTextElementLementModelCopyWith<$Res> implements $HtmlTextElementModelCopyWith<$Res> {
  factory _$HtmlTextElementLementModelCopyWith(_HtmlTextElementLementModel value, $Res Function(_HtmlTextElementLementModel) _then) = __$HtmlTextElementLementModelCopyWithImpl;
@override @useResult
$Res call({
 String text, HtmlTextAlign textAlign
});




}
/// @nodoc
class __$HtmlTextElementLementModelCopyWithImpl<$Res>
    implements _$HtmlTextElementLementModelCopyWith<$Res> {
  __$HtmlTextElementLementModelCopyWithImpl(this._self, this._then);

  final _HtmlTextElementLementModel _self;
  final $Res Function(_HtmlTextElementLementModel) _then;

/// Create a copy of HtmlTextElementModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? textAlign = null,}) {
  return _then(_HtmlTextElementLementModel(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,textAlign: null == textAlign ? _self.textAlign : textAlign // ignore: cast_nullable_to_non_nullable
as HtmlTextAlign,
  ));
}


}

// dart format on
