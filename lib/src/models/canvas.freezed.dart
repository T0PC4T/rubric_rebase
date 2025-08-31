// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'canvas.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CanvasSettings _$CanvasSettingsFromJson(Map<String, dynamic> json) {
  return _CanvasSettings.fromJson(json);
}

/// @nodoc
mixin _$CanvasSettings {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
  Color get backgroundColor => throw _privateConstructorUsedError;
  @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
  Color get canvasColor => throw _privateConstructorUsedError;
  double get spacing => throw _privateConstructorUsedError;
  String get fontFamily => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;

  /// Serializes this CanvasSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CanvasSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CanvasSettingsCopyWith<CanvasSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CanvasSettingsCopyWith<$Res> {
  factory $CanvasSettingsCopyWith(
          CanvasSettings value, $Res Function(CanvasSettings) then) =
      _$CanvasSettingsCopyWithImpl<$Res, CanvasSettings>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
      Color backgroundColor,
      @JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color canvasColor,
      double spacing,
      String fontFamily,
      String icon});
}

/// @nodoc
class _$CanvasSettingsCopyWithImpl<$Res, $Val extends CanvasSettings>
    implements $CanvasSettingsCopyWith<$Res> {
  _$CanvasSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CanvasSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? backgroundColor = null,
    Object? canvasColor = null,
    Object? spacing = null,
    Object? fontFamily = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      canvasColor: null == canvasColor
          ? _value.canvasColor
          : canvasColor // ignore: cast_nullable_to_non_nullable
              as Color,
      spacing: null == spacing
          ? _value.spacing
          : spacing // ignore: cast_nullable_to_non_nullable
              as double,
      fontFamily: null == fontFamily
          ? _value.fontFamily
          : fontFamily // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CanvasSettingsImplCopyWith<$Res>
    implements $CanvasSettingsCopyWith<$Res> {
  factory _$$CanvasSettingsImplCopyWith(_$CanvasSettingsImpl value,
          $Res Function(_$CanvasSettingsImpl) then) =
      __$$CanvasSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
      Color backgroundColor,
      @JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color canvasColor,
      double spacing,
      String fontFamily,
      String icon});
}

/// @nodoc
class __$$CanvasSettingsImplCopyWithImpl<$Res>
    extends _$CanvasSettingsCopyWithImpl<$Res, _$CanvasSettingsImpl>
    implements _$$CanvasSettingsImplCopyWith<$Res> {
  __$$CanvasSettingsImplCopyWithImpl(
      _$CanvasSettingsImpl _value, $Res Function(_$CanvasSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CanvasSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? backgroundColor = null,
    Object? canvasColor = null,
    Object? spacing = null,
    Object? fontFamily = null,
    Object? icon = null,
  }) {
    return _then(_$CanvasSettingsImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      canvasColor: null == canvasColor
          ? _value.canvasColor
          : canvasColor // ignore: cast_nullable_to_non_nullable
              as Color,
      spacing: null == spacing
          ? _value.spacing
          : spacing // ignore: cast_nullable_to_non_nullable
              as double,
      fontFamily: null == fontFamily
          ? _value.fontFamily
          : fontFamily // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CanvasSettingsImpl
    with DiagnosticableTreeMixin
    implements _CanvasSettings {
  const _$CanvasSettingsImpl(
      {required this.name,
      @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
      required this.backgroundColor,
      @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
      required this.canvasColor,
      this.spacing = 0,
      required this.fontFamily,
      required this.icon});

  factory _$CanvasSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CanvasSettingsImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
  final Color backgroundColor;
  @override
  @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
  final Color canvasColor;
  @override
  @JsonKey()
  final double spacing;
  @override
  final String fontFamily;
  @override
  final String icon;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CanvasSettings(name: $name, backgroundColor: $backgroundColor, canvasColor: $canvasColor, spacing: $spacing, fontFamily: $fontFamily, icon: $icon)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CanvasSettings'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('backgroundColor', backgroundColor))
      ..add(DiagnosticsProperty('canvasColor', canvasColor))
      ..add(DiagnosticsProperty('spacing', spacing))
      ..add(DiagnosticsProperty('fontFamily', fontFamily))
      ..add(DiagnosticsProperty('icon', icon));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CanvasSettingsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.canvasColor, canvasColor) ||
                other.canvasColor == canvasColor) &&
            (identical(other.spacing, spacing) || other.spacing == spacing) &&
            (identical(other.fontFamily, fontFamily) ||
                other.fontFamily == fontFamily) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, backgroundColor,
      canvasColor, spacing, fontFamily, icon);

  /// Create a copy of CanvasSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CanvasSettingsImplCopyWith<_$CanvasSettingsImpl> get copyWith =>
      __$$CanvasSettingsImplCopyWithImpl<_$CanvasSettingsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CanvasSettingsImplToJson(
      this,
    );
  }
}

abstract class _CanvasSettings implements CanvasSettings {
  const factory _CanvasSettings(
      {required final String name,
      @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
      required final Color backgroundColor,
      @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
      required final Color canvasColor,
      final double spacing,
      required final String fontFamily,
      required final String icon}) = _$CanvasSettingsImpl;

  factory _CanvasSettings.fromJson(Map<String, dynamic> json) =
      _$CanvasSettingsImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
  Color get backgroundColor;
  @override
  @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
  Color get canvasColor;
  @override
  double get spacing;
  @override
  String get fontFamily;
  @override
  String get icon;

  /// Create a copy of CanvasSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CanvasSettingsImplCopyWith<_$CanvasSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
