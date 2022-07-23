import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_repo_searcher/features/api/api_client.dart';
import 'package:github_repo_searcher/features/pagination/model/paging.dart';
import 'package:github_repo_searcher/features/repo/model/repo.dart';
import 'package:github_repo_searcher/features/repo/repo_search_bar_controller.dart';

import '../api/query_param.dart';

abstract class RepoSearchRepository {
  static final search = FutureProvider((ref) {
    final query = ref.watch(repoSearchBarController);
    return ref.watch(apiClient).get<Paging<Repo>>(
          path: '/search/repositories',
          queryParam: QueryParam(
            q: query,
          ),
          decoder: (json) => Paging.fromJson(json, Repo.fromJson),
        );
  });
}
