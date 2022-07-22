import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:github_repo_searcher/extension.dart';
import 'package:intersperse/intersperse.dart';

import 'model/repo.dart';

final selectedRepo = StateProvider<Repo?>((ref) => null);

class RepoDetailPage extends ConsumerWidget {
  const RepoDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(selectedRepo);
    return Scaffold(
      appBar: AppBar(),
      body: repo == null
          ? const Center(child: Text('Not Found'))
          : SafeArea(
              child: _Body(repo: repo),
            ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.repo});

  final Repo repo;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          repo.fullName,
          style: theme.textTheme.titleMedium,
        ),
        Text(
          repo.description,
          style: theme.textTheme.bodySmall,
        ),
        const Gap(16),
        const Divider(),
        const Gap(16),
        ...<Widget>[
          _Row(
            icon: const Icon(Icons.clear),
            title: '言語',
            value: repo.language ?? 'なし',
          ),
          _Row(
            icon: const Icon(Icons.star),
            title: 'スター数',
            value: repo.stargazersCount.compact,
          ),
          _Row(
            icon: const Icon(Icons.visibility),
            title: 'ウォッチ数',
            value: repo.watchersCount.compact,
          ),
          _Row(
            icon: const Icon(Icons.clear),
            title: 'フォーク数',
            value: repo.forksCount.compact,
          ),
          _Row(
            icon: const Icon(Icons.clear),
            title: 'イシュー数',
            value: repo.openIssuesCount.compact,
          ),
        ].intersperse(const Gap(16)),
      ],
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({
    required this.icon,
    required this.title,
    required this.value,
  });

  final Icon icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const Gap(8),
        Text(title),
        const Spacer(),
        Text(value),
      ],
    );
  }
}
