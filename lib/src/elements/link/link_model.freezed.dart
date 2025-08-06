// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'link_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LinkElementModel _$LinkElementModelFromJson(Map<String, dynamic> json) {
  return _LinkElementModel.fromJson(json);
}

/// @nodoc
mixin _$LinkElementModel {
  String get text => throw _privateConstructorUsedError;
  bool get isBold => throw _privateConstructorUsedError;
  bool get isItalic => throw _privateConstructorUsedError;
  bool get isUnderline => throw _privateConstructorUsedError;
  String get alignment => throw _privateConstructorUsedError;
  double get size => throw _privateConstructorUsedError;
  @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
  Color get color => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;

  /// Serializes this LinkElementModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LinkElementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LinkElementModelCopyWith<LinkElementModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinkElementModelCopyWith<$Res> {
  factory $LinkElementModelCopyWith(
          LinkElementModel value, $Res Function(LinkElementModel) then) =
      _$LinkElementModelCopyWithImpl<$Res, LinkElementModel>;
  @useResult
  $Res call(
      {String text,
      bool isBold,
      bool isItalic,
      bool isUnderline,
      String alignment,
      double size,
      @JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color color,
      String link});
}

/// @nodoc
class _$LinkElementModelCopyWithImpl<$Res, $Val extends LinkElementModel>
    implements $LinkElementModelCopyWith<$Res> {
  _$LinkElementModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LinkElementModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? isBold = null,
    Object? isItalic = null,
    Object? isUnderline = null,
    Object? alignment = null,
    Object? size = null,
    Object? color = null,
    Object? link = null,
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
      isUnderline: null == isUnderline
          ? _value.isUnderline
          : isUnderline // ignore: cast_nullable_to_non_nullable
              as bool,
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
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LinkElementModelImplCopyWith<$Res>
    implements $LinkElementModelCopyWith<$Res> {
  factory _$$LinkElementModelImplCopyWith(_$LinkElementModelImpl value,
          $Res Function(_$LinkElementModelImpl) then) =
      __$$LinkElementModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String text,
      bool isBold,
      bool isItalic,
      bool isUnderline,
      String alignment,
      double size,
      @JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color color,
      String link});
}

/// @nodoc
class __$$LinkElementModelImplCopyWithImpl<$Res>
    extends _$LinkElementModelCopyWithImpl<$Res, _$LinkElementModelImpl>
    implements _$$LinkElementModelImplCopyWith<$Res> {
  __$$LinkElementModelImplCopyWithImpl(_$LinkElementModelImpl _value,
      $Res Function(_$LinkElementModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LinkElementModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? isBold = null,
    Object? isItalic = null,
    Object? isUnderline = null,
    Object? alignment = null,
    Object? size = null,
    Object? color = null,
    Object? link = null,
  }) {
    return _then(_$LinkElementModelImpl(
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
      isUnderline: null == isUnderline
          ? _value.isUnderline
          : isUnderline // ignore: cast_nullable_to_non_nullable
              as bool,
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
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$LinkElementModelImpl extends _LinkElementModel {
  const _$LinkElementModelImpl(
      {required this.text,
      this.isBold = false,
      this.isItalic = false,
      this.isUnderline = false,
      this.alignment = ElementAlignment.left,
      required this.size,
      @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
      required this.color,
      required this.link})
      : super._();

  factory _$LinkElementModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LinkElementModelImplFromJson(json);

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
  final bool isUnderline;
  @override
  @JsonKey()
  final String alignment;
  @override
  final double size;
  @override
  @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
  final Color color;
  @override
  final String link;

  @override
  String toString() {
    return 'LinkElementModel(text: $text, isBold: $isBold, isItalic: $isItalic, isUnderline: $isUnderline, alignment: $alignment, size: $size, color: $color, link: $link)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LinkElementModelImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.isBold, isBold) || other.isBold == isBold) &&
            (identical(other.isItalic, isItalic) ||
                other.isItalic == isItalic) &&
            (identical(other.isUnderline, isUnderline) ||
                other.isUnderline == isUnderline) &&
            (identical(other.alignment, alignment) ||
                other.alignment == alignment) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.link, link) || other.link == link));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text, isBold, isItalic,
      isUnderline, alignment, size, color, link);

  /// Create a copy of LinkElementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LinkElementModelImplCopyWith<_$LinkElementModelImpl> get copyWith =>
      __$$LinkElementModelImplCopyWithImpl<_$LinkElementModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LinkElementModelImplToJson(
      this,
    );
  }
}

abstract class _LinkElementModel extends LinkElementModel {
  const factory _LinkElementModel(
      {required final String text,
      final bool isBold,
      final bool isItalic,
      final bool isUnderline,
      final String alignment,
      required final double size,
      @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
      required final Color color,
      required final String link}) = _$LinkElementModelImpl;
  const _LinkElementModel._() : super._();

  factory _LinkElementModel.fromJson(Map<String, dynamic> json) =
      _$LinkElementModelImpl.fromJson;

  @override
  String get text;
  @override
  bool get isBold;
  @override
  bool get isItalic;
  @override
  bool get isUnderline;
  @override
  String get alignment;
  @override
  double get size;
  @override
  @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
  Color get color;
  @override
  String get link;

  /// Create a copy of LinkElementModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LinkElementModelImplCopyWith<_$LinkElementModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
