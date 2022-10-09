import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:github_repo_searcher/common/common.dart';
import 'package:github_repo_searcher/features/search/search_provider.dart';
import 'package:github_repo_searcher/theme/themes.dart';
import 'package:go_router/go_router.dart';

import '../repo_page.dart';
import 'circular_icon_tag.dart';

class RepoTile extends ConsumerWidget {
  const RepoTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final repo = ref.watch(currentRepoProvider);
    const padding = EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 8,
    );
    return SafeArea(
      child: repo.when(
        loading: () => const Padding(
          padding: padding,
          child: _ShimmerTile(),
        ),
        error: (error, stackTrace) => Center(
          child: Padding(
            padding: padding,
            child: Text(error.toString()),
          ),
        ),
        data: (repo) {
          return InkWell(
            onTap: () {
              ref.read(selectedRepo.notifier).state = repo;
              context.goNamed(
                'repo_detail',
                params: {'repoId': repo.id.toString()},
              );
            },
            child: Padding(
              padding: padding,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          repo.fullName,
                          style: theme.textTheme.bodyLarge!.copyWith(
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
                              iconBackgroundColor:
                                  theme.appColors.starIconSurface,
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
          );
        },
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
    return Row(
      children: [
        CircularIconTag(
          iconBackgroundColor: iconBackgroundColor,
          iconData: iconData,
          isDense: true,
        ),
        const Gap(2),
        Text(value, style: theme.textTheme.labelSmall),
      ],
    );
  }
}

class _ShimmerTile extends StatelessWidget {
  const _ShimmerTile();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final color = colorScheme.onBackground.withOpacity(0.1);
    const gap = Gap(6);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          height: 20,
          color: color,
        ),
        gap,
        Container(
          width: double.infinity,
          height: 16,
          color: color,
        ),
        gap,
        Row(
          children: [
            Container(
              width: 40,
              height: 16,
              color: color,
            ),
            gap,
            Container(
              width: 40,
              height: 16,
              color: color,
            ),
          ],
        ),
      ],
    );
  }
}
