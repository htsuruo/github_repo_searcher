import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_repo_searcher/common/common.dart';

class AsyncValueBuilder<T> extends StatelessWidget {
  const AsyncValueBuilder({
    super.key,
    required this.value,
    required this.builder,
    required this.onRefresh,
  });

  final AsyncValue<T> value;
  final Widget Function(T data) builder;
  final RefreshCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return value.isLoading
        ? const CenteredCircularProgressIndicator()
        : value.when(
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
            data: (data) => RefreshIndicator(
              backgroundColor: colorScheme.onPrimary,
              onRefresh: onRefresh,
              child: builder(data),
            ),
          );
  }
}
