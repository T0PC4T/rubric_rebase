// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TextListElementModel {

 List<String> get textList; bool get isBold; bool get isItalic; dynamic get isUnderline; TextListTypes get textListType; double get size;@JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color get color;
/// Create a copy of TextListElementModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextListElementModelCopyWith<TextListElementModel> get copyWith => _$TextListElementModelCopyWithImpl<TextListElementModel>(this as TextListElementModel, _$identity);

  /// Serializes this TextListElementModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextListElementModel&&const DeepCollectionEquality().equals(other.textList, textList)&&(identical(other.isBold, isBold) || other.isBold == isBold)&&(identical(other.isItalic, isItalic) || other.isItalic == isItalic)&&const DeepCollectionEquality().equals(other.isUnderline, isUnderline)&&(identical(other.textListType, textListType) || other.textListType == textListType)&&(identical(other.size, size) || other.size == size)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(textList),isBold,isItalic,const DeepCollectionEquality().hash(isUnderline),textListType,size,color);

@override
String toString() {
  return 'TextListElementModel(textList: $textList, isBold: $isBold, isItalic: $isItalic, isUnderline: $isUnderline, textListType: $textListType, size: $size, color: $color)';
}


}

/// @nodoc
abstract mixin class $TextListElementModelCopyWith<$Res>  {
  factory $TextListElementModelCopyWith(TextListElementModel value, $Res Function(TextListElementModel) _then) = _$TextListElementModelCopyWithImpl;
@useResult
$Res call({
 List<String> textList, bool isBold, bool isItalic, dynamic isUnderline, TextListTypes textListType, double size,@JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color color
});




}
/// @nodoc
class _$TextListElementModelCopyWithImpl<$Res>
    implements $TextListElementModelCopyWith<$Res> {
  _$TextListElementModelCopyWithImpl(this._self, this._then);

  final TextListElementModel _self;
  final $Res Function(TextListElementModel) _then;

/// Create a copy of TextListElementModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? textList = null,Object? isBold = null,Object? isItalic = null,Object? isUnderline = freezed,Object? textListType = null,Object? size = null,Object? color = null,}) {
  return _then(_self.copyWith(
textList: null == textList ? _self.textList : textList // ignore: cast_nullable_to_non_nullable
as List<String>,isBold: null == isBold ? _self.isBold : isBold // ignore: cast_nullable_to_non_nullable
as bool,isItalic: null == isItalic ? _self.isItalic : isItalic // ignore: cast_nullable_to_non_nullable
as bool,isUnderline: freezed == isUnderline ? _self.isUnderline : isUnderline // ignore: cast_nullable_to_non_nullable
as dynamic,textListType: null == textListType ? _self.textListType : textListType // ignore: cast_nullable_to_non_nullable
as TextListTypes,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as double,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}

}


/// Adds pattern-matching-related methods to [TextListElementModel].
extension TextListElementModelPatterns on TextListElementModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TextListElementModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TextListElementModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TextListElementModel value)  $default,){
final _that = this;
switch (_that) {
case _TextListElementModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TextListElementModel value)?  $default,){
final _that = this;
switch (_that) {
case _TextListElementModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> textList,  bool isBold,  bool isItalic,  dynamic isUnderline,  TextListTypes textListType,  double size, @JsonKey(toJson: colorToJson, fromJson: colorFromJson)  Color color)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TextListElementModel() when $default != null:
return $default(_that.textList,_that.isBold,_that.isItalic,_that.isUnderline,_that.textListType,_that.size,_that.color);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> textList,  bool isBold,  bool isItalic,  dynamic isUnderline,  TextListTypes textListType,  double size, @JsonKey(toJson: colorToJson, fromJson: colorFromJson)  Color color)  $default,) {final _that = this;
switch (_that) {
case _TextListElementModel():
return $default(_that.textList,_that.isBold,_that.isItalic,_that.isUnderline,_that.textListType,_that.size,_that.color);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> textList,  bool isBold,  bool isItalic,  dynamic isUnderline,  TextListTypes textListType,  double size, @JsonKey(toJson: colorToJson, fromJson: colorFromJson)  Color color)?  $default,) {final _that = this;
switch (_that) {
case _TextListElementModel() when $default != null:
return $default(_that.textList,_that.isBold,_that.isItalic,_that.isUnderline,_that.textListType,_that.size,_that.color);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable()
class _TextListElementModel extends TextListElementModel {
  const _TextListElementModel({required final  List<String> textList, this.isBold = false, this.isItalic = false, this.isUnderline = false, this.textListType = TextListTypes.bulleted, required this.size, @JsonKey(toJson: colorToJson, fromJson: colorFromJson) required this.color}): _textList = textList,super._();
  factory _TextListElementModel.fromJson(Map<String, dynamic> json) => _$TextListElementModelFromJson(json);

 final  List<String> _textList;
@override List<String> get textList {
  if (_textList is EqualUnmodifiableListView) return _textList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_textList);
}

@override@JsonKey() final  bool isBold;
@override@JsonKey() final  bool isItalic;
@override@JsonKey() final  dynamic isUnderline;
@override@JsonKey() final  TextListTypes textListType;
@override final  double size;
@override@JsonKey(toJson: colorToJson, fromJson: colorFromJson) final  Color color;

/// Create a copy of TextListElementModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TextListElementModelCopyWith<_TextListElementModel> get copyWith => __$TextListElementModelCopyWithImpl<_TextListElementModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TextListElementModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TextListElementModel&&const DeepCollectionEquality().equals(other._textList, _textList)&&(identical(other.isBold, isBold) || other.isBold == isBold)&&(identical(other.isItalic, isItalic) || other.isItalic == isItalic)&&const DeepCollectionEquality().equals(other.isUnderline, isUnderline)&&(identical(other.textListType, textListType) || other.textListType == textListType)&&(identical(other.size, size) || other.size == size)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_textList),isBold,isItalic,const DeepCollectionEquality().hash(isUnderline),textListType,size,color);

@override
String toString() {
  return 'TextListElementModel(textList: $textList, isBold: $isBold, isItalic: $isItalic, isUnderline: $isUnderline, textListType: $textListType, size: $size, color: $color)';
}


}

/// @nodoc
abstract mixin class _$TextListElementModelCopyWith<$Res> implements $TextListElementModelCopyWith<$Res> {
  factory _$TextListElementModelCopyWith(_TextListElementModel value, $Res Function(_TextListElementModel) _then) = __$TextListElementModelCopyWithImpl;
@override @useResult
$Res call({
 List<String> textList, bool isBold, bool isItalic, dynamic isUnderline, TextListTypes textListType, double size,@JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color color
});




}
/// @nodoc
class __$TextListElementModelCopyWithImpl<$Res>
    implements _$TextListElementModelCopyWith<$Res> {
  __$TextListElementModelCopyWithImpl(this._self, this._then);

  final _TextListElementModel _self;
  final $Res Function(_TextListElementModel) _then;

/// Create a copy of TextListElementModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? textList = null,Object? isBold = null,Object? isItalic = null,Object? isUnderline = freezed,Object? textListType = null,Object? size = null,Object? color = null,}) {
  return _then(_TextListElementModel(
textList: null == textList ? _self._textList : textList // ignore: cast_nullable_to_non_nullable
as List<String>,isBold: null == isBold ? _self.isBold : isBold // ignore: cast_nullable_to_non_nullable
as bool,isItalic: null == isItalic ? _self.isItalic : isItalic // ignore: cast_nullable_to_non_nullable
as bool,isUnderline: freezed == isUnderline ? _self.isUnderline : isUnderline // ignore: cast_nullable_to_non_nullable
as dynamic,textListType: null == textListType ? _self.textListType : textListType // ignore: cast_nullable_to_non_nullable
as TextListTypes,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as double,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}

// dart format on
