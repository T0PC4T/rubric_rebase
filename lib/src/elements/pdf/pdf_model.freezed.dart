// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pdf_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PdfElementModel {

 String get pdfUrl;
/// Create a copy of PdfElementModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PdfElementModelCopyWith<PdfElementModel> get copyWith => _$PdfElementModelCopyWithImpl<PdfElementModel>(this as PdfElementModel, _$identity);

  /// Serializes this PdfElementModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PdfElementModel&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pdfUrl);

@override
String toString() {
  return 'PdfElementModel(pdfUrl: $pdfUrl)';
}


}

/// @nodoc
abstract mixin class $PdfElementModelCopyWith<$Res>  {
  factory $PdfElementModelCopyWith(PdfElementModel value, $Res Function(PdfElementModel) _then) = _$PdfElementModelCopyWithImpl;
@useResult
$Res call({
 String pdfUrl
});




}
/// @nodoc
class _$PdfElementModelCopyWithImpl<$Res>
    implements $PdfElementModelCopyWith<$Res> {
  _$PdfElementModelCopyWithImpl(this._self, this._then);

  final PdfElementModel _self;
  final $Res Function(PdfElementModel) _then;

/// Create a copy of PdfElementModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pdfUrl = null,}) {
  return _then(_self.copyWith(
pdfUrl: null == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PdfElementModel].
extension PdfElementModelPatterns on PdfElementModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PdfElementModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PdfElementModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PdfElementModel value)  $default,){
final _that = this;
switch (_that) {
case _PdfElementModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PdfElementModel value)?  $default,){
final _that = this;
switch (_that) {
case _PdfElementModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String pdfUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PdfElementModel() when $default != null:
return $default(_that.pdfUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String pdfUrl)  $default,) {final _that = this;
switch (_that) {
case _PdfElementModel():
return $default(_that.pdfUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String pdfUrl)?  $default,) {final _that = this;
switch (_that) {
case _PdfElementModel() when $default != null:
return $default(_that.pdfUrl);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable()
class _PdfElementModel extends PdfElementModel {
  const _PdfElementModel({required this.pdfUrl}): super._();
  factory _PdfElementModel.fromJson(Map<String, dynamic> json) => _$PdfElementModelFromJson(json);

@override final  String pdfUrl;

/// Create a copy of PdfElementModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PdfElementModelCopyWith<_PdfElementModel> get copyWith => __$PdfElementModelCopyWithImpl<_PdfElementModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PdfElementModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PdfElementModel&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pdfUrl);

@override
String toString() {
  return 'PdfElementModel(pdfUrl: $pdfUrl)';
}


}

/// @nodoc
abstract mixin class _$PdfElementModelCopyWith<$Res> implements $PdfElementModelCopyWith<$Res> {
  factory _$PdfElementModelCopyWith(_PdfElementModel value, $Res Function(_PdfElementModel) _then) = __$PdfElementModelCopyWithImpl;
@override @useResult
$Res call({
 String pdfUrl
});




}
/// @nodoc
class __$PdfElementModelCopyWithImpl<$Res>
    implements _$PdfElementModelCopyWith<$Res> {
  __$PdfElementModelCopyWithImpl(this._self, this._then);

  final _PdfElementModel _self;
  final $Res Function(_PdfElementModel) _then;

/// Create a copy of PdfElementModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pdfUrl = null,}) {
  return _then(_PdfElementModel(
pdfUrl: null == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
