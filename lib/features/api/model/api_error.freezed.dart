// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'api_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiError _$ApiErrorFromJson(Map<String, dynamic> json) {
  return _ApiError.fromJson(json);
}

/// @nodoc
mixin _$ApiError {
  String get resource => throw _privateConstructorUsedError;
  String get field => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiErrorCopyWith<ApiError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiErrorCopyWith<$Res> {
  factory $ApiErrorCopyWith(ApiError value, $Res Function(ApiError) then) =
      _$ApiErrorCopyWithImpl<$Res>;
  $Res call({String resource, String field, String code});
}

/// @nodoc
class _$ApiErrorCopyWithImpl<$Res> implements $ApiErrorCopyWith<$Res> {
  _$ApiErrorCopyWithImpl(this._value, this._then);

  final ApiError _value;
  // ignore: unused_field
  final $Res Function(ApiError) _then;

  @override
  $Res call({
    Object? resource = freezed,
    Object? field = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      resource: resource == freezed
          ? _value.resource
          : resource // ignore: cast_nullable_to_non_nullable
              as String,
      field: field == freezed
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ApiErrorCopyWith<$Res> implements $ApiErrorCopyWith<$Res> {
  factory _$$_ApiErrorCopyWith(
          _$_ApiError value, $Res Function(_$_ApiError) then) =
      __$$_ApiErrorCopyWithImpl<$Res>;
  @override
  $Res call({String resource, String field, String code});
}

/// @nodoc
class __$$_ApiErrorCopyWithImpl<$Res> extends _$ApiErrorCopyWithImpl<$Res>
    implements _$$_ApiErrorCopyWith<$Res> {
  __$$_ApiErrorCopyWithImpl(
      _$_ApiError _value, $Res Function(_$_ApiError) _then)
      : super(_value, (v) => _then(v as _$_ApiError));

  @override
  _$_ApiError get _value => super._value as _$_ApiError;

  @override
  $Res call({
    Object? resource = freezed,
    Object? field = freezed,
    Object? code = freezed,
  }) {
    return _then(_$_ApiError(
      resource: resource == freezed
          ? _value.resource
          : resource // ignore: cast_nullable_to_non_nullable
              as String,
      field: field == freezed
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApiError extends _ApiError {
  const _$_ApiError(
      {required this.resource, required this.field, required this.code})
      : super._();

  factory _$_ApiError.fromJson(Map<String, dynamic> json) =>
      _$$_ApiErrorFromJson(json);

  @override
  final String resource;
  @override
  final String field;
  @override
  final String code;

  @override
  String toString() {
    return 'ApiError(resource: $resource, field: $field, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiError &&
            const DeepCollectionEquality().equals(other.resource, resource) &&
            const DeepCollectionEquality().equals(other.field, field) &&
            const DeepCollectionEquality().equals(other.code, code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(resource),
      const DeepCollectionEquality().hash(field),
      const DeepCollectionEquality().hash(code));

  @JsonKey(ignore: true)
  @override
  _$$_ApiErrorCopyWith<_$_ApiError> get copyWith =>
      __$$_ApiErrorCopyWithImpl<_$_ApiError>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApiErrorToJson(
      this,
    );
  }
}

abstract class _ApiError extends ApiError {
  const factory _ApiError(
      {required final String resource,
      required final String field,
      required final String code}) = _$_ApiError;
  const _ApiError._() : super._();

  factory _ApiError.fromJson(Map<String, dynamic> json) = _$_ApiError.fromJson;

  @override
  String get resource;
  @override
  String get field;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$_ApiErrorCopyWith<_$_ApiError> get copyWith =>
      throw _privateConstructorUsedError;
}
