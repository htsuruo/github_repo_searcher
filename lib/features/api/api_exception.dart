// GitHub API v3のクライアントエラーを表現するクラスです。
// ref. https://docs.github.com/ja/rest/overview/resources-in-the-rest-api#client-errors
class ApiException implements Exception {
  ApiException({
    required this.code,
    required this.message,
    this.errors,
    this.documentationUrl,
  });
  final int code;
  final String message;
  final List<ApiErrors>? errors;
  final String? documentationUrl;
}

class ApiErrors {
  ApiErrors({required this.resource, required this.field, required this.code});
  final String resource;
  final String field;
  final String code;
}
