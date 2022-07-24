import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:github_repo_searcher/common/common.dart';
import 'package:github_repo_searcher/features/pagination/model/paging.dart';
import 'package:github_repo_searcher/features/repo/model/repo.dart';
import 'package:github_repo_searcher/features/repo/repo_detail_page.dart';
import 'package:github_repo_searcher/features/repo/repo_not_found.dart';
import 'package:github_repo_searcher/features/repo/repo_search_repository.dart';
import 'package:github_repo_searcher/theme/themes.dart';
import 'package:go_router/go_router.dart';

import 'repo_search_bar/repo_search_bar.dart';

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
            value: ref.watch(RepoSearchRepository.search),
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
                                  child: Center(
                                    child: CircularProgressIndicator.adaptive(),
                                  ),
                                );
                              }
                              return _Tile(repo: repos[index]);
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

class _Tile extends ConsumerWidget {
  const _Tile({required this.repo});

  final Repo repo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return SafeArea(
      child: InkWell(
        onTap: () {
          ref.read(selectedRepo.notifier).state = repo;
          context.goNamed(
            'repo_detail',
            params: {'repoId': repo.id.toString()},
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      repo.fullName,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      repo.description,
                      style: theme.textTheme.bodySmall,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Gap(4),
                    Row(
                      children: [
                        _TagLabel(
                          iconBackgroundColor:
                              theme.appColors.languageIconSurface,
                          iconData: Icons.language,
                          value: repo.language ?? '---',
                        ),
                        const Gap(8),
                        _TagLabel(
                          iconBackgroundColor: theme.appColors.starIconSurface,
                          iconData: Icons.star,
                          value: repo.stargazersCount.compact,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.navigate_next),
            ],
          ),
        ),
      ),
    );
  }
}

class _TagLabel extends StatelessWidget {
  const _TagLabel({
    required this.iconBackgroundColor,
    required this.iconData,
    required this.value,
  });

  final Color iconBackgroundColor;
  final IconData iconData;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: iconBackgroundColor,
          ),
          child: Icon(
            iconData,
            size: 10,
            color: colorScheme.surface,
          ),
        ),
        const Gap(2),
        Text(value, style: theme.textTheme.labelSmall),
      ],
    );
  }
}
