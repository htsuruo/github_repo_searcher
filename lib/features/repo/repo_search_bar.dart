import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_repo_searcher/common/extensions/extensions.dart';
import 'package:github_repo_searcher/features/repo/repo_search_bar_controller.dart';

class RepoSearchBar extends ConsumerWidget {
  const RepoSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final controller = ref.watch(repoSearchBarController.notifier);
    return TextFormField(
      controller: controller.searchTextController,
      autocorrect: false,
      autofocus: true,
      style: theme.textTheme.bodyMedium!.copyWith(
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        constraints: const BoxConstraints(
          maxHeight: 40,
        ),
        hintText: context.l10n.searchRepoHint,
        hintStyle: theme.textTheme.bodyMedium!.copyWith(
          color: Colors.grey,
        ),
        filled: true,
        fillColor: colorScheme.primary.withOpacity(.1),
        suffixIcon: IconButton(
          onPressed: controller.search,
          icon: const Icon(Icons.search),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }
}
