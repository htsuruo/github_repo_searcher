import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_repo_searcher/common/common.dart';
import 'package:github_repo_searcher/features/pagination/model/paging.dart';
import 'package:github_repo_searcher/features/repo_search/model/repo.dart';
import 'package:github_repo_searcher/features/repo_search/repo_detail_page.dart';
import 'package:github_repo_searcher/features/repo_search/repo_search_repository.dart';
import 'package:go_router/go_router.dart';

class RepoSearchPage extends ConsumerWidget {
  const RepoSearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueBuilder<Paging<Repo>>(
      value: ref.watch(RepoSearchRepository.search),
      builder: (paging) {
        final repos = paging.items;
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Text(
                    '${repos.length} / ${paging.totalCount}',
                  ),
                ),
              ),
              const Divider(),
              Expanded(
                child: ListView.separated(
                  itemCount: paging.items.length,
                  separatorBuilder: (context, _) => const Divider(),
                  itemBuilder: (context, index) {
                    final repo = repos[index];
                    if (index >= repos.length) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }
                    return ListTile(
                      visualDensity: VisualDensity.compact,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 2,
                      ),
                      onTap: () {
                        ref.read(selectedRepo.notifier).state = repo;
                        context.goNamed(
                          'repo_detail',
                          params: {'repoId': repo.id.toString()},
                        );
                      },
                      title: Text(repo.fullName),
                      subtitle: Text(
                        repo.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: const Icon(Icons.navigate_next),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
