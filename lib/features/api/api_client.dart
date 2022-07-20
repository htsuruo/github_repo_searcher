import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_repo_searcher/features/api/query_param.dart';
import 'package:github_repo_searcher/logger.dart';
import 'package:http/http.dart' as http;

final apiClient = Provider((ref) => ApiClient(ref.read));

class ApiClient {
  ApiClient(this._read);
  final Reader _read;

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
          Uri.https(_host, path, <String, String>{}),
          headers: _headers,
        )
        .timeout(_timeout);

    if (res.statusCode == 200) {
      return decoder(res as Map<String, dynamic>);
    }

    // TODO(tsuruoka): エラー内容がわかるようにする
    logger.severe(res.statusCode);
    throw Exception('Failed to get $path');
  }
}
