// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rich_text_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RichTextElementModel _$RichTextElementModelFromJson(Map<String, dynamic> json) {
  return _RichTextElementModel.fromJson(json);
}

/// @nodoc
mixin _$RichTextElementModel {
  @JsonKey(toJson: _documentToString, fromJson: _documentFromString)
  Document get document => throw _privateConstructorUsedError;

  /// Serializes this RichTextElementModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RichTextElementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RichTextElementModelCopyWith<RichTextElementModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RichTextElementModelCopyWith<$Res> {
  factory $RichTextElementModelCopyWith(RichTextElementModel value,
          $Res Function(RichTextElementModel) then) =
      _$RichTextElementModelCopyWithImpl<$Res, RichTextElementModel>;
  @useResult
  $Res call(
      {@JsonKey(toJson: _documentToString, fromJson: _documentFromString)
      Document document});
}

/// @nodoc
class _$RichTextElementModelCopyWithImpl<$Res,
        $Val extends RichTextElementModel>
    implements $RichTextElementModelCopyWith<$Res> {
  _$RichTextElementModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RichTextElementModel
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
abstract class _$$RichTextElementModelImplCopyWith<$Res>
    implements $RichTextElementModelCopyWith<$Res> {
  factory _$$RichTextElementModelImplCopyWith(_$RichTextElementModelImpl value,
          $Res Function(_$RichTextElementModelImpl) then) =
      __$$RichTextElementModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(toJson: _documentToString, fromJson: _documentFromString)
      Document document});
}

/// @nodoc
class __$$RichTextElementModelImplCopyWithImpl<$Res>
    extends _$RichTextElementModelCopyWithImpl<$Res, _$RichTextElementModelImpl>
    implements _$$RichTextElementModelImplCopyWith<$Res> {
  __$$RichTextElementModelImplCopyWithImpl(_$RichTextElementModelImpl _value,
      $Res Function(_$RichTextElementModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RichTextElementModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? document = null,
  }) {
    return _then(_$RichTextElementModelImpl(
      document: null == document
          ? _value.document
          : document // ignore: cast_nullable_to_non_nullable
              as Document,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$RichTextElementModelImpl implements _RichTextElementModel {
  const _$RichTextElementModelImpl(
      {@JsonKey(toJson: _documentToString, fromJson: _documentFromString)
      required this.document});

  factory _$RichTextElementModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RichTextElementModelImplFromJson(json);

  @override
  @JsonKey(toJson: _documentToString, fromJson: _documentFromString)
  final Document document;

  @override
  String toString() {
    return 'RichTextElementModel(document: $document)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RichTextElementModelImpl &&
            (identical(other.document, document) ||
                other.document == document));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, document);

  /// Create a copy of RichTextElementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RichTextElementModelImplCopyWith<_$RichTextElementModelImpl>
      get copyWith =>
          __$$RichTextElementModelImplCopyWithImpl<_$RichTextElementModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RichTextElementModelImplToJson(
      this,
    );
  }
}

abstract class _RichTextElementModel implements RichTextElementModel {
  const factory _RichTextElementModel(
      {@JsonKey(toJson: _documentToString, fromJson: _documentFromString)
      required final Document document}) = _$RichTextElementModelImpl;

  factory _RichTextElementModel.fromJson(Map<String, dynamic> json) =
      _$RichTextElementModelImpl.fromJson;

  @override
  @JsonKey(toJson: _documentToString, fromJson: _documentFromString)
  Document get document;

  /// Create a copy of RichTextElementModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RichTextElementModelImplCopyWith<_$RichTextElementModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
