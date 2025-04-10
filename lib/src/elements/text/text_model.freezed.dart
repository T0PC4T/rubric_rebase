// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TextElementModel _$TextElementModelFromJson(Map<String, dynamic> json) {
  return _TextElementModel.fromJson(json);
}

/// @nodoc
mixin _$TextElementModel {
  String get text => throw _privateConstructorUsedError;
  bool get isBold => throw _privateConstructorUsedError;
  bool get isItalic => throw _privateConstructorUsedError;
  dynamic get isUnderline => throw _privateConstructorUsedError;
  String get alignment => throw _privateConstructorUsedError;
  double get size => throw _privateConstructorUsedError;
  @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
  Color get color => throw _privateConstructorUsedError;

  /// Serializes this TextElementModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TextElementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TextElementModelCopyWith<TextElementModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextElementModelCopyWith<$Res> {
  factory $TextElementModelCopyWith(
          TextElementModel value, $Res Function(TextElementModel) then) =
      _$TextElementModelCopyWithImpl<$Res, TextElementModel>;
  @useResult
  $Res call(
      {String text,
      bool isBold,
      bool isItalic,
      dynamic isUnderline,
      String alignment,
      double size,
      @JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color color});
}

/// @nodoc
class _$TextElementModelCopyWithImpl<$Res, $Val extends TextElementModel>
    implements $TextElementModelCopyWith<$Res> {
  _$TextElementModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TextElementModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? isBold = null,
    Object? isItalic = null,
    Object? isUnderline = freezed,
    Object? alignment = null,
    Object? size = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      isBold: null == isBold
          ? _value.isBold
          : isBold // ignore: cast_nullable_to_non_nullable
              as bool,
      isItalic: null == isItalic
          ? _value.isItalic
          : isItalic // ignore: cast_nullable_to_non_nullable
              as bool,
      isUnderline: freezed == isUnderline
          ? _value.isUnderline
          : isUnderline // ignore: cast_nullable_to_non_nullable
              as dynamic,
      alignment: null == alignment
          ? _value.alignment
          : alignment // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TextElementModelImplCopyWith<$Res>
    implements $TextElementModelCopyWith<$Res> {
  factory _$$TextElementModelImplCopyWith(_$TextElementModelImpl value,
          $Res Function(_$TextElementModelImpl) then) =
      __$$TextElementModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String text,
      bool isBold,
      bool isItalic,
      dynamic isUnderline,
      String alignment,
      double size,
      @JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color color});
}

/// @nodoc
class __$$TextElementModelImplCopyWithImpl<$Res>
    extends _$TextElementModelCopyWithImpl<$Res, _$TextElementModelImpl>
    implements _$$TextElementModelImplCopyWith<$Res> {
  __$$TextElementModelImplCopyWithImpl(_$TextElementModelImpl _value,
      $Res Function(_$TextElementModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TextElementModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? isBold = null,
    Object? isItalic = null,
    Object? isUnderline = freezed,
    Object? alignment = null,
    Object? size = null,
    Object? color = null,
  }) {
    return _then(_$TextElementModelImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      isBold: null == isBold
          ? _value.isBold
          : isBold // ignore: cast_nullable_to_non_nullable
              as bool,
      isItalic: null == isItalic
          ? _value.isItalic
          : isItalic // ignore: cast_nullable_to_non_nullable
              as bool,
      isUnderline: freezed == isUnderline ? _value.isUnderline! : isUnderline,
      alignment: null == alignment
          ? _value.alignment
          : alignment // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$TextElementModelImpl extends _TextElementModel {
  const _$TextElementModelImpl(
      {required this.text,
      this.isBold = false,
      this.isItalic = false,
      this.isUnderline = false,
      this.alignment = ElementAlignment.left,
      required this.size,
      @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
      required this.color})
      : super._();

  factory _$TextElementModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TextElementModelImplFromJson(json);

  @override
  final String text;
  @override
  @JsonKey()
  final bool isBold;
  @override
  @JsonKey()
  final bool isItalic;
  @override
  @JsonKey()
  final dynamic isUnderline;
  @override
  @JsonKey()
  final String alignment;
  @override
  final double size;
  @override
  @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
  final Color color;

  @override
  String toString() {
    return 'TextElementModel(text: $text, isBold: $isBold, isItalic: $isItalic, isUnderline: $isUnderline, alignment: $alignment, size: $size, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextElementModelImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.isBold, isBold) || other.isBold == isBold) &&
            (identical(other.isItalic, isItalic) ||
                other.isItalic == isItalic) &&
            const DeepCollectionEquality()
                .equals(other.isUnderline, isUnderline) &&
            (identical(other.alignment, alignment) ||
                other.alignment == alignment) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text, isBold, isItalic,
      const DeepCollectionEquality().hash(isUnderline), alignment, size, color);

  /// Create a copy of TextElementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TextElementModelImplCopyWith<_$TextElementModelImpl> get copyWith =>
      __$$TextElementModelImplCopyWithImpl<_$TextElementModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TextElementModelImplToJson(
      this,
    );
  }
}

abstract class _TextElementModel extends TextElementModel {
  const factory _TextElementModel(
      {required final String text,
      final bool isBold,
      final bool isItalic,
      final dynamic isUnderline,
      final String alignment,
      required final double size,
      @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
      required final Color color}) = _$TextElementModelImpl;
  const _TextElementModel._() : super._();

  factory _TextElementModel.fromJson(Map<String, dynamic> json) =
      _$TextElementModelImpl.fromJson;

  @override
  String get text;
  @override
  bool get isBold;
  @override
  bool get isItalic;
  @override
  dynamic get isUnderline;
  @override
  String get alignment;
  @override
  double get size;
  @override
  @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
  Color get color;

  /// Create a copy of TextElementModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TextElementModelImplCopyWith<_$TextElementModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
