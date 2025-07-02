// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TextListElementModel _$TextListElementModelFromJson(Map<String, dynamic> json) {
  return _TextListElementModel.fromJson(json);
}

/// @nodoc
mixin _$TextListElementModel {
  List<String> get textList => throw _privateConstructorUsedError;
  bool get isBold => throw _privateConstructorUsedError;
  bool get isItalic => throw _privateConstructorUsedError;
  dynamic get isUnderline => throw _privateConstructorUsedError;
  TextListTypes get textListType => throw _privateConstructorUsedError;
  double get size => throw _privateConstructorUsedError;
  @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
  Color get color => throw _privateConstructorUsedError;

  /// Serializes this TextListElementModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TextListElementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TextListElementModelCopyWith<TextListElementModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextListElementModelCopyWith<$Res> {
  factory $TextListElementModelCopyWith(TextListElementModel value,
          $Res Function(TextListElementModel) then) =
      _$TextListElementModelCopyWithImpl<$Res, TextListElementModel>;
  @useResult
  $Res call(
      {List<String> textList,
      bool isBold,
      bool isItalic,
      dynamic isUnderline,
      TextListTypes textListType,
      double size,
      @JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color color});
}

/// @nodoc
class _$TextListElementModelCopyWithImpl<$Res,
        $Val extends TextListElementModel>
    implements $TextListElementModelCopyWith<$Res> {
  _$TextListElementModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TextListElementModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textList = null,
    Object? isBold = null,
    Object? isItalic = null,
    Object? isUnderline = freezed,
    Object? textListType = null,
    Object? size = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      textList: null == textList
          ? _value.textList
          : textList // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      textListType: null == textListType
          ? _value.textListType
          : textListType // ignore: cast_nullable_to_non_nullable
              as TextListTypes,
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
abstract class _$$TextListElementModelImplCopyWith<$Res>
    implements $TextListElementModelCopyWith<$Res> {
  factory _$$TextListElementModelImplCopyWith(_$TextListElementModelImpl value,
          $Res Function(_$TextListElementModelImpl) then) =
      __$$TextListElementModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> textList,
      bool isBold,
      bool isItalic,
      dynamic isUnderline,
      TextListTypes textListType,
      double size,
      @JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color color});
}

/// @nodoc
class __$$TextListElementModelImplCopyWithImpl<$Res>
    extends _$TextListElementModelCopyWithImpl<$Res, _$TextListElementModelImpl>
    implements _$$TextListElementModelImplCopyWith<$Res> {
  __$$TextListElementModelImplCopyWithImpl(_$TextListElementModelImpl _value,
      $Res Function(_$TextListElementModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TextListElementModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textList = null,
    Object? isBold = null,
    Object? isItalic = null,
    Object? isUnderline = freezed,
    Object? textListType = null,
    Object? size = null,
    Object? color = null,
  }) {
    return _then(_$TextListElementModelImpl(
      textList: null == textList
          ? _value._textList
          : textList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isBold: null == isBold
          ? _value.isBold
          : isBold // ignore: cast_nullable_to_non_nullable
              as bool,
      isItalic: null == isItalic
          ? _value.isItalic
          : isItalic // ignore: cast_nullable_to_non_nullable
              as bool,
      isUnderline: freezed == isUnderline ? _value.isUnderline! : isUnderline,
      textListType: null == textListType
          ? _value.textListType
          : textListType // ignore: cast_nullable_to_non_nullable
              as TextListTypes,
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
class _$TextListElementModelImpl extends _TextListElementModel {
  const _$TextListElementModelImpl(
      {required final List<String> textList,
      this.isBold = false,
      this.isItalic = false,
      this.isUnderline = false,
      this.textListType = TextListTypes.bulleted,
      required this.size,
      @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
      required this.color})
      : _textList = textList,
        super._();

  factory _$TextListElementModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TextListElementModelImplFromJson(json);

  final List<String> _textList;
  @override
  List<String> get textList {
    if (_textList is EqualUnmodifiableListView) return _textList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_textList);
  }

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
  final TextListTypes textListType;
  @override
  final double size;
  @override
  @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
  final Color color;

  @override
  String toString() {
    return 'TextListElementModel(textList: $textList, isBold: $isBold, isItalic: $isItalic, isUnderline: $isUnderline, textListType: $textListType, size: $size, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextListElementModelImpl &&
            const DeepCollectionEquality().equals(other._textList, _textList) &&
            (identical(other.isBold, isBold) || other.isBold == isBold) &&
            (identical(other.isItalic, isItalic) ||
                other.isItalic == isItalic) &&
            const DeepCollectionEquality()
                .equals(other.isUnderline, isUnderline) &&
            (identical(other.textListType, textListType) ||
                other.textListType == textListType) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_textList),
      isBold,
      isItalic,
      const DeepCollectionEquality().hash(isUnderline),
      textListType,
      size,
      color);

  /// Create a copy of TextListElementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TextListElementModelImplCopyWith<_$TextListElementModelImpl>
      get copyWith =>
          __$$TextListElementModelImplCopyWithImpl<_$TextListElementModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TextListElementModelImplToJson(
      this,
    );
  }
}

abstract class _TextListElementModel extends TextListElementModel {
  const factory _TextListElementModel(
      {required final List<String> textList,
      final bool isBold,
      final bool isItalic,
      final dynamic isUnderline,
      final TextListTypes textListType,
      required final double size,
      @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
      required final Color color}) = _$TextListElementModelImpl;
  const _TextListElementModel._() : super._();

  factory _TextListElementModel.fromJson(Map<String, dynamic> json) =
      _$TextListElementModelImpl.fromJson;

  @override
  List<String> get textList;
  @override
  bool get isBold;
  @override
  bool get isItalic;
  @override
  dynamic get isUnderline;
  @override
  TextListTypes get textListType;
  @override
  double get size;
  @override
  @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
  Color get color;

  /// Create a copy of TextListElementModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TextListElementModelImplCopyWith<_$TextListElementModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
