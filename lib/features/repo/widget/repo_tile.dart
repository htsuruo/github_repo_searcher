import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:github_repo_searcher/common/common.dart';
import 'package:github_repo_searcher/theme/themes.dart';
import 'package:go_router/go_router.dart';

import '../model/repo.dart';
import '../repo_detail_page.dart';
import 'circular_icon_tag.dart';

class RepoTile extends ConsumerWidget {
  const RepoTile({super.key, required this.repo});

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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
