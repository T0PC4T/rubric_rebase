// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'canvas.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CanvasSettings implements DiagnosticableTreeMixin {

 String get name;@JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color get backgroundColor;@JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color get canvasColor; double get spacing; String get fontFamily; String get icon;
/// Create a copy of CanvasSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CanvasSettingsCopyWith<CanvasSettings> get copyWith => _$CanvasSettingsCopyWithImpl<CanvasSettings>(this as CanvasSettings, _$identity);

  /// Serializes this CanvasSettings to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CanvasSettings'))
    ..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('backgroundColor', backgroundColor))..add(DiagnosticsProperty('canvasColor', canvasColor))..add(DiagnosticsProperty('spacing', spacing))..add(DiagnosticsProperty('fontFamily', fontFamily))..add(DiagnosticsProperty('icon', icon));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CanvasSettings&&(identical(other.name, name) || other.name == name)&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor)&&(identical(other.canvasColor, canvasColor) || other.canvasColor == canvasColor)&&(identical(other.spacing, spacing) || other.spacing == spacing)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,backgroundColor,canvasColor,spacing,fontFamily,icon);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CanvasSettings(name: $name, backgroundColor: $backgroundColor, canvasColor: $canvasColor, spacing: $spacing, fontFamily: $fontFamily, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $CanvasSettingsCopyWith<$Res>  {
  factory $CanvasSettingsCopyWith(CanvasSettings value, $Res Function(CanvasSettings) _then) = _$CanvasSettingsCopyWithImpl;
@useResult
$Res call({
 String name,@JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color backgroundColor,@JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color canvasColor, double spacing, String fontFamily, String icon
});




}
/// @nodoc
class _$CanvasSettingsCopyWithImpl<$Res>
    implements $CanvasSettingsCopyWith<$Res> {
  _$CanvasSettingsCopyWithImpl(this._self, this._then);

  final CanvasSettings _self;
  final $Res Function(CanvasSettings) _then;

/// Create a copy of CanvasSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? backgroundColor = null,Object? canvasColor = null,Object? spacing = null,Object? fontFamily = null,Object? icon = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,backgroundColor: null == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as Color,canvasColor: null == canvasColor ? _self.canvasColor : canvasColor // ignore: cast_nullable_to_non_nullable
as Color,spacing: null == spacing ? _self.spacing : spacing // ignore: cast_nullable_to_non_nullable
as double,fontFamily: null == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CanvasSettings].
extension CanvasSettingsPatterns on CanvasSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CanvasSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CanvasSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CanvasSettings value)  $default,){
final _that = this;
switch (_that) {
case _CanvasSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CanvasSettings value)?  $default,){
final _that = this;
switch (_that) {
case _CanvasSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name, @JsonKey(toJson: colorToJson, fromJson: colorFromJson)  Color backgroundColor, @JsonKey(toJson: colorToJson, fromJson: colorFromJson)  Color canvasColor,  double spacing,  String fontFamily,  String icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CanvasSettings() when $default != null:
return $default(_that.name,_that.backgroundColor,_that.canvasColor,_that.spacing,_that.fontFamily,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name, @JsonKey(toJson: colorToJson, fromJson: colorFromJson)  Color backgroundColor, @JsonKey(toJson: colorToJson, fromJson: colorFromJson)  Color canvasColor,  double spacing,  String fontFamily,  String icon)  $default,) {final _that = this;
switch (_that) {
case _CanvasSettings():
return $default(_that.name,_that.backgroundColor,_that.canvasColor,_that.spacing,_that.fontFamily,_that.icon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name, @JsonKey(toJson: colorToJson, fromJson: colorFromJson)  Color backgroundColor, @JsonKey(toJson: colorToJson, fromJson: colorFromJson)  Color canvasColor,  double spacing,  String fontFamily,  String icon)?  $default,) {final _that = this;
switch (_that) {
case _CanvasSettings() when $default != null:
return $default(_that.name,_that.backgroundColor,_that.canvasColor,_that.spacing,_that.fontFamily,_that.icon);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable()
class _CanvasSettings extends CanvasSettings with DiagnosticableTreeMixin {
  const _CanvasSettings({required this.name, @JsonKey(toJson: colorToJson, fromJson: colorFromJson) required this.backgroundColor, @JsonKey(toJson: colorToJson, fromJson: colorFromJson) required this.canvasColor, this.spacing = 0, required this.fontFamily, required this.icon}): super._();
  factory _CanvasSettings.fromJson(Map<String, dynamic> json) => _$CanvasSettingsFromJson(json);

@override final  String name;
@override@JsonKey(toJson: colorToJson, fromJson: colorFromJson) final  Color backgroundColor;
@override@JsonKey(toJson: colorToJson, fromJson: colorFromJson) final  Color canvasColor;
@override@JsonKey() final  double spacing;
@override final  String fontFamily;
@override final  String icon;

/// Create a copy of CanvasSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CanvasSettingsCopyWith<_CanvasSettings> get copyWith => __$CanvasSettingsCopyWithImpl<_CanvasSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CanvasSettingsToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CanvasSettings'))
    ..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('backgroundColor', backgroundColor))..add(DiagnosticsProperty('canvasColor', canvasColor))..add(DiagnosticsProperty('spacing', spacing))..add(DiagnosticsProperty('fontFamily', fontFamily))..add(DiagnosticsProperty('icon', icon));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CanvasSettings&&(identical(other.name, name) || other.name == name)&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor)&&(identical(other.canvasColor, canvasColor) || other.canvasColor == canvasColor)&&(identical(other.spacing, spacing) || other.spacing == spacing)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,backgroundColor,canvasColor,spacing,fontFamily,icon);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CanvasSettings(name: $name, backgroundColor: $backgroundColor, canvasColor: $canvasColor, spacing: $spacing, fontFamily: $fontFamily, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$CanvasSettingsCopyWith<$Res> implements $CanvasSettingsCopyWith<$Res> {
  factory _$CanvasSettingsCopyWith(_CanvasSettings value, $Res Function(_CanvasSettings) _then) = __$CanvasSettingsCopyWithImpl;
@override @useResult
$Res call({
 String name,@JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color backgroundColor,@JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color canvasColor, double spacing, String fontFamily, String icon
});




}
/// @nodoc
class __$CanvasSettingsCopyWithImpl<$Res>
    implements _$CanvasSettingsCopyWith<$Res> {
  __$CanvasSettingsCopyWithImpl(this._self, this._then);

  final _CanvasSettings _self;
  final $Res Function(_CanvasSettings) _then;

/// Create a copy of CanvasSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? backgroundColor = null,Object? canvasColor = null,Object? spacing = null,Object? fontFamily = null,Object? icon = null,}) {
  return _then(_CanvasSettings(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,backgroundColor: null == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as Color,canvasColor: null == canvasColor ? _self.canvasColor : canvasColor // ignore: cast_nullable_to_non_nullable
as Color,spacing: null == spacing ? _self.spacing : spacing // ignore: cast_nullable_to_non_nullable
as double,fontFamily: null == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
