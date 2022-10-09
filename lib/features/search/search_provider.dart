import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_repo_searcher/features/search/model/repo.dart';
import 'package:github_repo_searcher/services/api/api_client.dart';
import 'package:github_repo_searcher/services/api/query_param.dart';
import 'package:github_repo_searcher/services/paging/model/paging.dart';

import 'search_bar/search_bar.dart';

final searchRepoPagingProvider =
    FutureProvider.family<Paging<Repo>, int>((ref, page) {
  final query = ref.watch(searchBarController);
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
  // MEMO(tsuruoka): 検索クエリを入れ替えても`whenData`のisLoadingは常にfalseとなるので分岐を追加
  final repo = ref.watch(searchRepoPagingProvider(1));
  return repo.isLoading
      ? const AsyncLoading()
      : repo.whenData(
          (paging) => paging.totalCount,
        );
});

final currentRepoProvider = Provider<AsyncValue<Repo>>(
  (ref) => throw UnimplementedError(),
);
