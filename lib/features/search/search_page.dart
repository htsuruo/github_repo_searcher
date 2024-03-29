import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_repo_searcher/common/common.dart';
import 'package:github_repo_searcher/features/base/bottom_navigation_type.dart';
import 'package:github_repo_searcher/features/base/scroll_provider.dart';

import 'search_bar/search_bar.dart';
import 'search_provider.dart';
import 'widget/repo_not_found.dart';
import 'widget/repo_tile.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    const horizontalPadding = 16.0;
    return Column(
      children: [
        const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: 8,
            ),
            child: SearchBar(),
          ),
        ),
        const Divider(),
        Expanded(
          child: AsyncValueBuilder<int>(
            value: ref.watch(repoTotalCountProvider),
            onRefresh: () => ref.refresh(searchRepoPagingProvider(1).future),
            builder: (totalCount) {
              return Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                        vertical: 4,
                      ),
                      child: Text(
                        context.l10n.searchResultTotalCount(totalCount),
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                  ),
                  Expanded(
                    child: totalCount < 1
                        ? const RepoNotFound()
                        : ListView.separated(
                            controller: ref
                                .watch(
                                  scrollProvider(BottomNavigationType.search),
                                )
                                .controller,
                            itemCount: totalCount,
                            separatorBuilder: (context, _) => const Divider(),
                            itemBuilder: (context, index) {
                              final currentRepoFromIndex = ref
                                  .watch(searchRepoPagingProvider(index ~/ 30))
                                  .whenData(
                                    (paging) => paging.items[index % 30],
                                  );
                              return ProviderScope(
                                overrides: [
                                  currentRepoProvider.overrideWithValue(
                                    currentRepoFromIndex,
                                  )
                                ],
                                child: const RepoTile(),
                              );
                            },
                          ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
