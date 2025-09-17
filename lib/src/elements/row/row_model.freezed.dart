// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'row_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RowElementModel {

@JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color get color; List<List<Map<String, dynamic>>> get elements; int get columns;
/// Create a copy of RowElementModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RowElementModelCopyWith<RowElementModel> get copyWith => _$RowElementModelCopyWithImpl<RowElementModel>(this as RowElementModel, _$identity);

  /// Serializes this RowElementModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RowElementModel&&(identical(other.color, color) || other.color == color)&&const DeepCollectionEquality().equals(other.elements, elements)&&(identical(other.columns, columns) || other.columns == columns));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,color,const DeepCollectionEquality().hash(elements),columns);

@override
String toString() {
  return 'RowElementModel(color: $color, elements: $elements, columns: $columns)';
}


}

/// @nodoc
abstract mixin class $RowElementModelCopyWith<$Res>  {
  factory $RowElementModelCopyWith(RowElementModel value, $Res Function(RowElementModel) _then) = _$RowElementModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color color, List<List<Map<String, dynamic>>> elements, int columns
});




}
/// @nodoc
class _$RowElementModelCopyWithImpl<$Res>
    implements $RowElementModelCopyWith<$Res> {
  _$RowElementModelCopyWithImpl(this._self, this._then);

  final RowElementModel _self;
  final $Res Function(RowElementModel) _then;

/// Create a copy of RowElementModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? color = null,Object? elements = null,Object? columns = null,}) {
  return _then(_self.copyWith(
color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,elements: null == elements ? _self.elements : elements // ignore: cast_nullable_to_non_nullable
as List<List<Map<String, dynamic>>>,columns: null == columns ? _self.columns : columns // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RowElementModel].
extension RowElementModelPatterns on RowElementModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RowElementModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RowElementModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RowElementModel value)  $default,){
final _that = this;
switch (_that) {
case _RowElementModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RowElementModel value)?  $default,){
final _that = this;
switch (_that) {
case _RowElementModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(toJson: colorToJson, fromJson: colorFromJson)  Color color,  List<List<Map<String, dynamic>>> elements,  int columns)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RowElementModel() when $default != null:
return $default(_that.color,_that.elements,_that.columns);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(toJson: colorToJson, fromJson: colorFromJson)  Color color,  List<List<Map<String, dynamic>>> elements,  int columns)  $default,) {final _that = this;
switch (_that) {
case _RowElementModel():
return $default(_that.color,_that.elements,_that.columns);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(toJson: colorToJson, fromJson: colorFromJson)  Color color,  List<List<Map<String, dynamic>>> elements,  int columns)?  $default,) {final _that = this;
switch (_that) {
case _RowElementModel() when $default != null:
return $default(_that.color,_that.elements,_that.columns);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable()
class _RowElementModel extends RowElementModel {
  const _RowElementModel({@JsonKey(toJson: colorToJson, fromJson: colorFromJson) required this.color, required final  List<List<Map<String, dynamic>>> elements, required this.columns}): _elements = elements,super._();
  factory _RowElementModel.fromJson(Map<String, dynamic> json) => _$RowElementModelFromJson(json);

@override@JsonKey(toJson: colorToJson, fromJson: colorFromJson) final  Color color;
 final  List<List<Map<String, dynamic>>> _elements;
@override List<List<Map<String, dynamic>>> get elements {
  if (_elements is EqualUnmodifiableListView) return _elements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_elements);
}

@override final  int columns;

/// Create a copy of RowElementModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RowElementModelCopyWith<_RowElementModel> get copyWith => __$RowElementModelCopyWithImpl<_RowElementModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RowElementModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RowElementModel&&(identical(other.color, color) || other.color == color)&&const DeepCollectionEquality().equals(other._elements, _elements)&&(identical(other.columns, columns) || other.columns == columns));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,color,const DeepCollectionEquality().hash(_elements),columns);

@override
String toString() {
  return 'RowElementModel(color: $color, elements: $elements, columns: $columns)';
}


}

/// @nodoc
abstract mixin class _$RowElementModelCopyWith<$Res> implements $RowElementModelCopyWith<$Res> {
  factory _$RowElementModelCopyWith(_RowElementModel value, $Res Function(_RowElementModel) _then) = __$RowElementModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color color, List<List<Map<String, dynamic>>> elements, int columns
});




}
/// @nodoc
class __$RowElementModelCopyWithImpl<$Res>
    implements _$RowElementModelCopyWith<$Res> {
  __$RowElementModelCopyWithImpl(this._self, this._then);

  final _RowElementModel _self;
  final $Res Function(_RowElementModel) _then;

/// Create a copy of RowElementModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? color = null,Object? elements = null,Object? columns = null,}) {
  return _then(_RowElementModel(
color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,elements: null == elements ? _self._elements : elements // ignore: cast_nullable_to_non_nullable
as List<List<Map<String, dynamic>>>,columns: null == columns ? _self.columns : columns // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
