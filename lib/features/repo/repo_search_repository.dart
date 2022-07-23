import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_repo_searcher/features/api/api_client.dart';
import 'package:github_repo_searcher/features/pagination/model/paging.dart';
import 'package:github_repo_searcher/features/repo/model/repo.dart';

import '../api/query_param.dart';

abstract class RepoSearchRepository {
  static final search = FutureProvider((ref) {
    return ref.watch(apiClient).get<Paging<Repo>>(
          path: '/search/repositories',
          queryParam: const QueryParam(
            q: 'flutter',
          ),
          decoder: (json) => Paging.fromJson(json, Repo.fromJson),
        );
  });
}
