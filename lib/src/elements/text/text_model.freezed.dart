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
  @JsonKey(toJson: _documentToString, fromJson: _documentFromString)
  Document get document => throw _privateConstructorUsedError;

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
      {@JsonKey(toJson: _documentToString, fromJson: _documentFromString)
      Document document});
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
    Object? document = null,
  }) {
    return _then(_value.copyWith(
      document: null == document
          ? _value.document
          : document // ignore: cast_nullable_to_non_nullable
              as Document,
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
      {@JsonKey(toJson: _documentToString, fromJson: _documentFromString)
      Document document});
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
    Object? document = null,
  }) {
    return _then(_$TextElementModelImpl(
      document: null == document
          ? _value.document
          : document // ignore: cast_nullable_to_non_nullable
              as Document,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$TextElementModelImpl implements _TextElementModel {
  const _$TextElementModelImpl(
      {@JsonKey(toJson: _documentToString, fromJson: _documentFromString)
      required this.document});

  factory _$TextElementModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TextElementModelImplFromJson(json);

  @override
  @JsonKey(toJson: _documentToString, fromJson: _documentFromString)
  final Document document;

  @override
  String toString() {
    return 'TextElementModel(document: $document)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextElementModelImpl &&
            (identical(other.document, document) ||
                other.document == document));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, document);

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

abstract class _TextElementModel implements TextElementModel {
  const factory _TextElementModel(
      {@JsonKey(toJson: _documentToString, fromJson: _documentFromString)
      required final Document document}) = _$TextElementModelImpl;

  factory _TextElementModel.fromJson(Map<String, dynamic> json) =
      _$TextElementModelImpl.fromJson;

  @override
  @JsonKey(toJson: _documentToString, fromJson: _documentFromString)
  Document get document;

  /// Create a copy of TextElementModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TextElementModelImplCopyWith<_$TextElementModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
