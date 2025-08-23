// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'row_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RowElementModel _$RowElementModelFromJson(Map<String, dynamic> json) {
  return _RowElementModel.fromJson(json);
}

/// @nodoc
mixin _$RowElementModel {
  List<List<Map<String, dynamic>>> get elements =>
      throw _privateConstructorUsedError;
  int get columns => throw _privateConstructorUsedError;

  /// Serializes this RowElementModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RowElementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RowElementModelCopyWith<RowElementModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RowElementModelCopyWith<$Res> {
  factory $RowElementModelCopyWith(
          RowElementModel value, $Res Function(RowElementModel) then) =
      _$RowElementModelCopyWithImpl<$Res, RowElementModel>;
  @useResult
  $Res call({List<List<Map<String, dynamic>>> elements, int columns});
}

/// @nodoc
class _$RowElementModelCopyWithImpl<$Res, $Val extends RowElementModel>
    implements $RowElementModelCopyWith<$Res> {
  _$RowElementModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RowElementModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? elements = null,
    Object? columns = null,
  }) {
    return _then(_value.copyWith(
      elements: null == elements
          ? _value.elements
          : elements // ignore: cast_nullable_to_non_nullable
              as List<List<Map<String, dynamic>>>,
      columns: null == columns
          ? _value.columns
          : columns // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RowElementModelImplCopyWith<$Res>
    implements $RowElementModelCopyWith<$Res> {
  factory _$$RowElementModelImplCopyWith(_$RowElementModelImpl value,
          $Res Function(_$RowElementModelImpl) then) =
      __$$RowElementModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<List<Map<String, dynamic>>> elements, int columns});
}

/// @nodoc
class __$$RowElementModelImplCopyWithImpl<$Res>
    extends _$RowElementModelCopyWithImpl<$Res, _$RowElementModelImpl>
    implements _$$RowElementModelImplCopyWith<$Res> {
  __$$RowElementModelImplCopyWithImpl(
      _$RowElementModelImpl _value, $Res Function(_$RowElementModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RowElementModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? elements = null,
    Object? columns = null,
  }) {
    return _then(_$RowElementModelImpl(
      elements: null == elements
          ? _value._elements
          : elements // ignore: cast_nullable_to_non_nullable
              as List<List<Map<String, dynamic>>>,
      columns: null == columns
          ? _value.columns
          : columns // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$RowElementModelImpl implements _RowElementModel {
  const _$RowElementModelImpl(
      {required final List<List<Map<String, dynamic>>> elements,
      required this.columns})
      : _elements = elements;

  factory _$RowElementModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RowElementModelImplFromJson(json);

  final List<List<Map<String, dynamic>>> _elements;
  @override
  List<List<Map<String, dynamic>>> get elements {
    if (_elements is EqualUnmodifiableListView) return _elements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_elements);
  }

  @override
  final int columns;

  @override
  String toString() {
    return 'RowElementModel(elements: $elements, columns: $columns)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RowElementModelImpl &&
            const DeepCollectionEquality().equals(other._elements, _elements) &&
            (identical(other.columns, columns) || other.columns == columns));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_elements), columns);

  /// Create a copy of RowElementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RowElementModelImplCopyWith<_$RowElementModelImpl> get copyWith =>
      __$$RowElementModelImplCopyWithImpl<_$RowElementModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RowElementModelImplToJson(
      this,
    );
  }
}

abstract class _RowElementModel implements RowElementModel {
  const factory _RowElementModel(
      {required final List<List<Map<String, dynamic>>> elements,
      required final int columns}) = _$RowElementModelImpl;

  factory _RowElementModel.fromJson(Map<String, dynamic> json) =
      _$RowElementModelImpl.fromJson;

  @override
  List<List<Map<String, dynamic>>> get elements;
  @override
  int get columns;

  /// Create a copy of RowElementModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RowElementModelImplCopyWith<_$RowElementModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
