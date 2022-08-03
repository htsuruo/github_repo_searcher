import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_repo_searcher/features/repo/model/repo.dart';
import 'package:github_repo_searcher/services/api/api_client.dart';
import 'package:github_repo_searcher/services/api/query_param.dart';
import 'package:github_repo_searcher/services/pagination/model/paging.dart';

import 'repo_search_bar/repo_search_bar.dart';

final searchRepoPagingProvider =
    FutureProvider.family<Paging<Repo>, int>((ref, page) {
  final query = ref.watch(repoSearchBarController);
  return ref.watch(apiClient).get<Paging<Repo>>(
        path: '/search/repositories',
        queryParam: QueryParam(
          q: query,
          page: page,
        ),
        decoder: (json) => Paging.fromJson(json, Repo.fromJson),
      );
});

final repoTotalCountProvider = Provider<AsyncValue<int>>((ref) {
  return ref.watch(searchRepoPagingProvider(1)).whenData(
        (paging) => paging.totalCount,
      );
});

final currentRepoProvider = Provider<AsyncValue<Repo>>(
  (ref) => throw UnimplementedError(),
);
