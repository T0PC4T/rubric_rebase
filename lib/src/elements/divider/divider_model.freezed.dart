// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'divider_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DividerElementModel _$DividerElementModelFromJson(Map<String, dynamic> json) {
  return _DividerElementModel.fromJson(json);
}

/// @nodoc
mixin _$DividerElementModel {
  @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
  Color get color => throw _privateConstructorUsedError;
  double get weight => throw _privateConstructorUsedError;

  /// Serializes this DividerElementModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DividerElementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DividerElementModelCopyWith<DividerElementModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DividerElementModelCopyWith<$Res> {
  factory $DividerElementModelCopyWith(
          DividerElementModel value, $Res Function(DividerElementModel) then) =
      _$DividerElementModelCopyWithImpl<$Res, DividerElementModel>;
  @useResult
  $Res call(
      {@JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color color,
      double weight});
}

/// @nodoc
class _$DividerElementModelCopyWithImpl<$Res, $Val extends DividerElementModel>
    implements $DividerElementModelCopyWith<$Res> {
  _$DividerElementModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DividerElementModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
    Object? weight = null,
  }) {
    return _then(_value.copyWith(
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DividerElementModelImplCopyWith<$Res>
    implements $DividerElementModelCopyWith<$Res> {
  factory _$$DividerElementModelImplCopyWith(_$DividerElementModelImpl value,
          $Res Function(_$DividerElementModelImpl) then) =
      __$$DividerElementModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(toJson: colorToJson, fromJson: colorFromJson) Color color,
      double weight});
}

/// @nodoc
class __$$DividerElementModelImplCopyWithImpl<$Res>
    extends _$DividerElementModelCopyWithImpl<$Res, _$DividerElementModelImpl>
    implements _$$DividerElementModelImplCopyWith<$Res> {
  __$$DividerElementModelImplCopyWithImpl(_$DividerElementModelImpl _value,
      $Res Function(_$DividerElementModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DividerElementModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
    Object? weight = null,
  }) {
    return _then(_$DividerElementModelImpl(
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$DividerElementModelImpl implements _DividerElementModel {
  const _$DividerElementModelImpl(
      {@JsonKey(toJson: colorToJson, fromJson: colorFromJson)
      required this.color,
      required this.weight});

  factory _$DividerElementModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DividerElementModelImplFromJson(json);

  @override
  @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
  final Color color;
  @override
  final double weight;

  @override
  String toString() {
    return 'DividerElementModel(color: $color, weight: $weight)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DividerElementModelImpl &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.weight, weight) || other.weight == weight));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, color, weight);

  /// Create a copy of DividerElementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DividerElementModelImplCopyWith<_$DividerElementModelImpl> get copyWith =>
      __$$DividerElementModelImplCopyWithImpl<_$DividerElementModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DividerElementModelImplToJson(
      this,
    );
  }
}

abstract class _DividerElementModel implements DividerElementModel {
  const factory _DividerElementModel(
      {@JsonKey(toJson: colorToJson, fromJson: colorFromJson)
      required final Color color,
      required final double weight}) = _$DividerElementModelImpl;

  factory _DividerElementModel.fromJson(Map<String, dynamic> json) =
      _$DividerElementModelImpl.fromJson;

  @override
  @JsonKey(toJson: colorToJson, fromJson: colorFromJson)
  Color get color;
  @override
  double get weight;

  /// Create a copy of DividerElementModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DividerElementModelImplCopyWith<_$DividerElementModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
