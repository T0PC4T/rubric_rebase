// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'button_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ButtonElementModel _$ButtonElementModelFromJson(Map<String, dynamic> json) {
  return _ButtonElementModel.fromJson(json);
}

/// @nodoc
mixin _$ButtonElementModel {
  String get text => throw _privateConstructorUsedError;
  String get style => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  double get borderRadius => throw _privateConstructorUsedError;
  @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
  Color get textColor => throw _privateConstructorUsedError;
  @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
  Color get color => throw _privateConstructorUsedError;

  /// Serializes this ButtonElementModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ButtonElementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ButtonElementModelCopyWith<ButtonElementModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ButtonElementModelCopyWith<$Res> {
  factory $ButtonElementModelCopyWith(
          ButtonElementModel value, $Res Function(ButtonElementModel) then) =
      _$ButtonElementModelCopyWithImpl<$Res, ButtonElementModel>;
  @useResult
  $Res call(
      {String text,
      String style,
      String link,
      double borderRadius,
      @JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color textColor,
      @JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color color});
}

/// @nodoc
class _$ButtonElementModelCopyWithImpl<$Res, $Val extends ButtonElementModel>
    implements $ButtonElementModelCopyWith<$Res> {
  _$ButtonElementModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ButtonElementModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? style = null,
    Object? link = null,
    Object? borderRadius = null,
    Object? textColor = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      style: null == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      borderRadius: null == borderRadius
          ? _value.borderRadius
          : borderRadius // ignore: cast_nullable_to_non_nullable
              as double,
      textColor: null == textColor
          ? _value.textColor
          : textColor // ignore: cast_nullable_to_non_nullable
              as Color,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ButtonElementModelImplCopyWith<$Res>
    implements $ButtonElementModelCopyWith<$Res> {
  factory _$$ButtonElementModelImplCopyWith(_$ButtonElementModelImpl value,
          $Res Function(_$ButtonElementModelImpl) then) =
      __$$ButtonElementModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String text,
      String style,
      String link,
      double borderRadius,
      @JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color textColor,
      @JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color color});
}

/// @nodoc
class __$$ButtonElementModelImplCopyWithImpl<$Res>
    extends _$ButtonElementModelCopyWithImpl<$Res, _$ButtonElementModelImpl>
    implements _$$ButtonElementModelImplCopyWith<$Res> {
  __$$ButtonElementModelImplCopyWithImpl(_$ButtonElementModelImpl _value,
      $Res Function(_$ButtonElementModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ButtonElementModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? style = null,
    Object? link = null,
    Object? borderRadius = null,
    Object? textColor = null,
    Object? color = null,
  }) {
    return _then(_$ButtonElementModelImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      style: null == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      borderRadius: null == borderRadius
          ? _value.borderRadius
          : borderRadius // ignore: cast_nullable_to_non_nullable
              as double,
      textColor: null == textColor
          ? _value.textColor
          : textColor // ignore: cast_nullable_to_non_nullable
              as Color,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$ButtonElementModelImpl extends _ButtonElementModel {
  const _$ButtonElementModelImpl(
      {required this.text,
      required this.style,
      required this.link,
      required this.borderRadius,
      @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
      required this.textColor,
      @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
      required this.color})
      : super._();

  factory _$ButtonElementModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ButtonElementModelImplFromJson(json);

  @override
  final String text;
  @override
  final String style;
  @override
  final String link;
  @override
  final double borderRadius;
  @override
  @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
  final Color textColor;
  @override
  @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
  final Color color;

  @override
  String toString() {
    return 'ButtonElementModel(text: $text, style: $style, link: $link, borderRadius: $borderRadius, textColor: $textColor, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ButtonElementModelImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.style, style) || other.style == style) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.borderRadius, borderRadius) ||
                other.borderRadius == borderRadius) &&
            (identical(other.textColor, textColor) ||
                other.textColor == textColor) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, text, style, link, borderRadius, textColor, color);

  /// Create a copy of ButtonElementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ButtonElementModelImplCopyWith<_$ButtonElementModelImpl> get copyWith =>
      __$$ButtonElementModelImplCopyWithImpl<_$ButtonElementModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ButtonElementModelImplToJson(
      this,
    );
  }
}

abstract class _ButtonElementModel extends ButtonElementModel {
  const factory _ButtonElementModel(
      {required final String text,
      required final String style,
      required final String link,
      required final double borderRadius,
      @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
      required final Color textColor,
      @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
      required final Color color}) = _$ButtonElementModelImpl;
  const _ButtonElementModel._() : super._();

  factory _ButtonElementModel.fromJson(Map<String, dynamic> json) =
      _$ButtonElementModelImpl.fromJson;

  @override
  String get text;
  @override
  String get style;
  @override
  String get link;
  @override
  double get borderRadius;
  @override
  @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
  Color get textColor;
  @override
  @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
  Color get color;

  /// Create a copy of ButtonElementModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ButtonElementModelImplCopyWith<_$ButtonElementModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
