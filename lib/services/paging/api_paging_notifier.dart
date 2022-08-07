import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_repo_searcher/logger.dart';
import 'package:github_repo_searcher/services/paging/model/paging.dart';
import 'package:github_repo_searcher/services/paging/paging_state.dart';

typedef PagingFetcher<T> = Future<Paging<T>> Function({
  required int from,
  required int size,
});

class ApiPagingNotifier<T> extends StateNotifier<AsyncValue<PagingState<T>>> {
  ApiPagingNotifier({
    required this.fetcher,
    this.defaultPagingSize = 10,
    int initialSize = 20,
  }) : super(const AsyncLoading()) {
    _loadMoreIfNeeded(pagingSize: initialSize);
  }

  final PagingFetcher<T> fetcher;
  final int defaultPagingSize;
  var _isLoadingMore = false;

  Future<void> _loadMoreIfNeeded({required int pagingSize}) async {
    // `!state.snapshots.isRefreshing` でチェックで済ませたかったが、
    // addPostFrameCallbackする故に連続で呼ばれた時に弾けない
    if ((state.value?.hasMore ?? true) && !_isLoadingMore) {
      _isLoadingMore = true;
      logger.info('loaded more');
      WidgetsBinding.instance.addPostFrameCallback((_) {
        state = AsyncLoading<PagingState<T>>().copyWithPrevious(
          state,
        );
      });
      state = (await AsyncValue.guard(() async {
        final fetchedItems = await fetcher(
          from: state.value?.items.length ?? 0,
          size: pagingSize + 1,
        );
        return PagingState(
          items: <T>[
            ...state.value?.items ?? [],
            ...fetchedItems.items.take(pagingSize),
          ],
          hasMore: fetchedItems.items.length > pagingSize,
        );
      }))
          .copyWithPrevious(state);
      if (state is AsyncError) {
        logger.warning('state is error: $state');
      }
      _isLoadingMore = false;
    }
  }

  void loadMoreIfNeeded({int? pagingSize}) =>
      _loadMoreIfNeeded(pagingSize: pagingSize ?? defaultPagingSize);
}
