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

  final textFormFieldNode = FocusNode(debugLabel: 'search_text_form_field');
  final iconButtonNode = FocusNode(debugLabel: 'search_icon_button');
  final searchTextController = TextEditingController();

  void search() {
    final inputText = searchTextController.text;
    logger.info(inputText);
    state = inputText;
  }
}
