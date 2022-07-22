import 'package:github_repo_searcher/features/api/model/api_error_body.dart';

class ApiException implements Exception {
  ApiException({
    required this.code,
    required this.body,
  });
  final int code;
  final ApiErrorBody body;

  @override
  String toString() => '[$code] ${body.toString()}';
}
