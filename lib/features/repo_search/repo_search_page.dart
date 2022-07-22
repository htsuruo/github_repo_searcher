import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_repo_searcher/features/repo_search/repo_search_repository.dart';

class RepoSearchPage extends ConsumerWidget {
  const RepoSearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO(tsuruoka): implement
    final repos = ref.watch(RepoSearchRepository.search);
    return repos.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Text(error.toString()),
      data: (repos) => const Text('text'),
    );
  }
}
