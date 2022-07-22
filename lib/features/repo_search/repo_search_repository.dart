import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_repo_searcher/features/api/api_client.dart';
import 'package:github_repo_searcher/features/pagination/model/paging.dart';
import 'package:github_repo_searcher/features/repo_search/model/repo.dart';

import '../api/query_param.dart';

abstract class RepoSearchRepository {
  // TODO(tsuruoka): データソースへの参照を記述する
  // FutureProviderを並べる箱として機能する

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
