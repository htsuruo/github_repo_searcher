// GitHub API v3のクライアントエラーを表現するクラスです。
// ref. https://docs.github.com/ja/rest/overview/resources-in-the-rest-api#client-errors

import 'package:freezed_annotation/freezed_annotation.dart';

import 'api_error.dart';

part 'api_error_body.freezed.dart';
part 'api_error_body.g.dart';

// GitHub API v3のクライアントエラーを表現するクラスです。
// ref. https://docs.github.com/ja/rest/overview/resources-in-the-rest-api#client-errors

@freezed
class ApiErrorBody with _$ApiErrorBody {
  const factory ApiErrorBody({
    required String message,
    List<ApiError>? errors,
    String? documentationUrl,
  }) = _ApiErrorBody;

  factory ApiErrorBody.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorBodyFromJson(json);
}
