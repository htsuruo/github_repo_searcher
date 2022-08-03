import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'model/api_error_body.dart';
import 'model/api_exception.dart';
import 'query_param.dart';

final apiClient = Provider((ref) => ApiClient());

class ApiClient {
  ApiClient();

  static const _host = 'api.github.com';
  static const _headers = {
    'Accept': 'application/vnd.github+json',
  };
  static const _timeout = Duration(seconds: 10);

  Future<T> get<T>({
    required String path,
    QueryParam? queryParam,
    required T Function(Map<String, dynamic> json) decoder,
  }) async {
    final res = await http
        .get(
          Uri.https(_host, path, queryParam?.toMap),
          headers: _headers,
        )
        .timeout(_timeout);

    final json = jsonDecode(res.body) as Map<String, dynamic>;
    if (res.statusCode == 200) {
      return decoder(json);
    }
    final errorBody = ApiErrorBody.fromJson(json);
    throw ApiException(code: res.statusCode, body: errorBody);
  }
}
