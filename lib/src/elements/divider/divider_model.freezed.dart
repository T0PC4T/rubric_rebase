// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'divider_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DividerElementModel {

@JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color get color; double get weight;
/// Create a copy of DividerElementModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DividerElementModelCopyWith<DividerElementModel> get copyWith => _$DividerElementModelCopyWithImpl<DividerElementModel>(this as DividerElementModel, _$identity);

  /// Serializes this DividerElementModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DividerElementModel&&(identical(other.color, color) || other.color == color)&&(identical(other.weight, weight) || other.weight == weight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,color,weight);

@override
String toString() {
  return 'DividerElementModel(color: $color, weight: $weight)';
}


}

/// @nodoc
abstract mixin class $DividerElementModelCopyWith<$Res>  {
  factory $DividerElementModelCopyWith(DividerElementModel value, $Res Function(DividerElementModel) _then) = _$DividerElementModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color color, double weight
});




}
/// @nodoc
class _$DividerElementModelCopyWithImpl<$Res>
    implements $DividerElementModelCopyWith<$Res> {
  _$DividerElementModelCopyWithImpl(this._self, this._then);

  final DividerElementModel _self;
  final $Res Function(DividerElementModel) _then;

/// Create a copy of DividerElementModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? color = null,Object? weight = null,}) {
  return _then(_self.copyWith(
color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [DividerElementModel].
extension DividerElementModelPatterns on DividerElementModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DividerElementModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DividerElementModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DividerElementModel value)  $default,){
final _that = this;
switch (_that) {
case _DividerElementModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DividerElementModel value)?  $default,){
final _that = this;
switch (_that) {
case _DividerElementModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(toJson: colorToJson, fromJson: colorFromJson)  Color color,  double weight)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DividerElementModel() when $default != null:
return $default(_that.color,_that.weight);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(toJson: colorToJson, fromJson: colorFromJson)  Color color,  double weight)  $default,) {final _that = this;
switch (_that) {
case _DividerElementModel():
return $default(_that.color,_that.weight);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(toJson: colorToJson, fromJson: colorFromJson)  Color color,  double weight)?  $default,) {final _that = this;
switch (_that) {
case _DividerElementModel() when $default != null:
return $default(_that.color,_that.weight);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable()
class _DividerElementModel extends DividerElementModel {
  const _DividerElementModel({@JsonKey(toJson: colorToJson, fromJson: colorFromJson) required this.color, required this.weight}): super._();
  factory _DividerElementModel.fromJson(Map<String, dynamic> json) => _$DividerElementModelFromJson(json);

@override@JsonKey(toJson: colorToJson, fromJson: colorFromJson) final  Color color;
@override final  double weight;

/// Create a copy of DividerElementModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DividerElementModelCopyWith<_DividerElementModel> get copyWith => __$DividerElementModelCopyWithImpl<_DividerElementModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DividerElementModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DividerElementModel&&(identical(other.color, color) || other.color == color)&&(identical(other.weight, weight) || other.weight == weight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,color,weight);

@override
String toString() {
  return 'DividerElementModel(color: $color, weight: $weight)';
}


}

/// @nodoc
abstract mixin class _$DividerElementModelCopyWith<$Res> implements $DividerElementModelCopyWith<$Res> {
  factory _$DividerElementModelCopyWith(_DividerElementModel value, $Res Function(_DividerElementModel) _then) = __$DividerElementModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color color, double weight
});




}
/// @nodoc
class __$DividerElementModelCopyWithImpl<$Res>
    implements _$DividerElementModelCopyWith<$Res> {
  __$DividerElementModelCopyWithImpl(this._self, this._then);

  final _DividerElementModel _self;
  final $Res Function(_DividerElementModel) _then;

/// Create a copy of DividerElementModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? color = null,Object? weight = null,}) {
  return _then(_DividerElementModel(
color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
