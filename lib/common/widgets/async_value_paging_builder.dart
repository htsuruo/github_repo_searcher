import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_repo_searcher/common/common.dart';
import 'package:github_repo_searcher/features/pagination/model/paging.dart';

class AsyncValuePagingBuilder<T> extends StatefulWidget {
  const AsyncValuePagingBuilder({
    super.key,
    required this.value,
    required this.builder,
  });

  final AsyncValue<Paging<T>> value;
  final Widget Function(Paging<T> paging) builder;

  @override
  State<AsyncValuePagingBuilder<T>> createState() =>
      _AsyncValuePagingBuilderState<T>();
}

class _AsyncValuePagingBuilderState<T>
    extends State<AsyncValuePagingBuilder<T>> {
  final items = <T>[];

  @override
  Widget build(BuildContext context) {
    return widget.value.isLoading
        ? const CenteredCircularProgressIndicator()
        : widget.value.when(
            loading: CenteredCircularProgressIndicator.new,
            error: (error, stackTrace) => SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    error.toString(),
                  ),
                ),
              ),
            ),
            data: (paging) {
              items.addAll(paging.items);
              return widget.builder(
                Paging(
                  totalCount: paging.totalCount,
                  incompleteResults: paging.incompleteResults,
                  items: items,
                ),
              );
            },
          );
  }
}
