import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_repo_searcher/logger.dart';

final repoSearchBarController =
    StateNotifierProvider<RepoSearchBarNotifier, String>(
  (ref) => RepoSearchBarNotifier(),
);

const _initialQuery = 'flutter';

class RepoSearchBarNotifier extends StateNotifier<String> {
  RepoSearchBarNotifier() : super(_initialQuery) {
    searchTextController.text = _initialQuery;
    state = _initialQuery;
  }

  final formGlobalKey = GlobalKey<FormState>();
  final searchTextController = TextEditingController();

  void search() {
    if (formGlobalKey.currentState!.validate()) {
      final inputText = searchTextController.text;
      logger.info('search: $inputText');
      state = inputText;
    }
  }
}
