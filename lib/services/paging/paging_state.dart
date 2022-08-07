import 'package:freezed_annotation/freezed_annotation.dart';

part 'paging_state.freezed.dart';

@freezed
class PagingState<T> with _$PagingState<T> {
  factory PagingState({
    required bool hasMore,
    required List<T> items,
  }) = _PagingState<T>;
  PagingState._();
  late final itemLoadingCount = items.length + (hasMore ? 1 : 0);

  bool isLoadingIndex(int index) => hasMore && (index + 1) == itemLoadingCount;
}
