// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'api_error_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApiException _$$_ApiExceptionFromJson(Map json) => _$_ApiException(
      code: json['code'] as int,
      message: json['message'] as String,
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => ApiError.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      documentationUrl: json['documentationUrl'] as String?,
    );

Map<String, dynamic> _$$_ApiExceptionToJson(_$_ApiException instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'errors': instance.errors?.map((e) => e.toJson()).toList(),
      'documentationUrl': instance.documentationUrl,
    };
