// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'api_error_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiErrorBody _$ApiErrorBodyFromJson(Map<String, dynamic> json) {
  return _ApiErrorBody.fromJson(json);
}

/// @nodoc
mixin _$ApiErrorBody {
  String get message => throw _privateConstructorUsedError;
  List<ApiError>? get errors => throw _privateConstructorUsedError;
  String? get documentationUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiErrorBodyCopyWith<ApiErrorBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiErrorBodyCopyWith<$Res> {
  factory $ApiErrorBodyCopyWith(
          ApiErrorBody value, $Res Function(ApiErrorBody) then) =
      _$ApiErrorBodyCopyWithImpl<$Res>;
  $Res call({String message, List<ApiError>? errors, String? documentationUrl});
}

/// @nodoc
class _$ApiErrorBodyCopyWithImpl<$Res> implements $ApiErrorBodyCopyWith<$Res> {
  _$ApiErrorBodyCopyWithImpl(this._value, this._then);

  final ApiErrorBody _value;
  // ignore: unused_field
  final $Res Function(ApiErrorBody) _then;

  @override
  $Res call({
    Object? message = freezed,
    Object? errors = freezed,
    Object? documentationUrl = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      errors: errors == freezed
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ApiError>?,
      documentationUrl: documentationUrl == freezed
          ? _value.documentationUrl
          : documentationUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ApiErrorBodyCopyWith<$Res>
    implements $ApiErrorBodyCopyWith<$Res> {
  factory _$$_ApiErrorBodyCopyWith(
          _$_ApiErrorBody value, $Res Function(_$_ApiErrorBody) then) =
      __$$_ApiErrorBodyCopyWithImpl<$Res>;
  @override
  $Res call({String message, List<ApiError>? errors, String? documentationUrl});
}

/// @nodoc
class __$$_ApiErrorBodyCopyWithImpl<$Res>
    extends _$ApiErrorBodyCopyWithImpl<$Res>
    implements _$$_ApiErrorBodyCopyWith<$Res> {
  __$$_ApiErrorBodyCopyWithImpl(
      _$_ApiErrorBody _value, $Res Function(_$_ApiErrorBody) _then)
      : super(_value, (v) => _then(v as _$_ApiErrorBody));

  @override
  _$_ApiErrorBody get _value => super._value as _$_ApiErrorBody;

  @override
  $Res call({
    Object? message = freezed,
    Object? errors = freezed,
    Object? documentationUrl = freezed,
  }) {
    return _then(_$_ApiErrorBody(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      errors: errors == freezed
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<ApiError>?,
      documentationUrl: documentationUrl == freezed
          ? _value.documentationUrl
          : documentationUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApiErrorBody implements _ApiErrorBody {
  const _$_ApiErrorBody(
      {required this.message,
      final List<ApiError>? errors,
      this.documentationUrl})
      : _errors = errors;

  factory _$_ApiErrorBody.fromJson(Map<String, dynamic> json) =>
      _$$_ApiErrorBodyFromJson(json);

  @override
  final String message;
  final List<ApiError>? _errors;
  @override
  List<ApiError>? get errors {
    final value = _errors;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? documentationUrl;

  @override
  String toString() {
    return 'ApiErrorBody(message: $message, errors: $errors, documentationUrl: $documentationUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiErrorBody &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other._errors, _errors) &&
            const DeepCollectionEquality()
                .equals(other.documentationUrl, documentationUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(_errors),
      const DeepCollectionEquality().hash(documentationUrl));

  @JsonKey(ignore: true)
  @override
  _$$_ApiErrorBodyCopyWith<_$_ApiErrorBody> get copyWith =>
      __$$_ApiErrorBodyCopyWithImpl<_$_ApiErrorBody>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApiErrorBodyToJson(
      this,
    );
  }
}

abstract class _ApiErrorBody implements ApiErrorBody {
  const factory _ApiErrorBody(
      {required final String message,
      final List<ApiError>? errors,
      final String? documentationUrl}) = _$_ApiErrorBody;

  factory _ApiErrorBody.fromJson(Map<String, dynamic> json) =
      _$_ApiErrorBody.fromJson;

  @override
  String get message;
  @override
  List<ApiError>? get errors;
  @override
  String? get documentationUrl;
  @override
  @JsonKey(ignore: true)
  _$$_ApiErrorBodyCopyWith<_$_ApiErrorBody> get copyWith =>
      throw _privateConstructorUsedError;
}
