import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_repo_searcher/common/common.dart';
import 'package:github_repo_searcher/features/pagination/model/paging.dart';
import 'package:github_repo_searcher/features/repo/model/repo.dart';
import 'package:github_repo_searcher/features/repo/widget/repo_not_found.dart';
import 'package:github_repo_searcher/features/repo/widget/repo_tile.dart';

import 'repo_search_bar/repo_search_bar.dart';
import 'repo_search_provider.dart';

class RepoSearchPage extends ConsumerWidget {
  const RepoSearchPage({super.key});

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
            child: RepoSearchBar(),
          ),
        ),
        const Divider(),
        Expanded(
          child: AsyncValueBuilder<Paging<Repo>>(
            value: ref.watch(searchRepoPagingProvider(1)),
            builder: (paging) {
              final repos = paging.items;
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
                        context.l10n.searchTotalCountResult(
                          paging.totalCount.format,
                        ),
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                  ),
                  Expanded(
                    child: repos.isEmpty
                        ? const RepoNotFound()
                        : ListView.separated(
                            itemCount: paging.items.length,
                            separatorBuilder: (context, _) => const Divider(),
                            itemBuilder: (context, index) {
                              if (index >= repos.length) {
                                return const Padding(
                                  padding: EdgeInsets.all(16),
                                  child: CenteredCircularProgressIndicator(),
                                );
                              }
                              return RepoTile(repo: repos[index]);
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
