import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_repo_searcher/logger.dart';

final repoSearchBarController =
    StateNotifierProvider<RepoSearchBarNotifier, String>(
  (ref) => RepoSearchBarNotifier(ref.read),
);

class RepoSearchBarNotifier extends StateNotifier<String> {
  RepoSearchBarNotifier(this._read) : super('');
  final Reader _read;

  final searchTextController = TextEditingController();

  void search() {
    final inputText = searchTextController.text;
    logger.info(inputText);
    state = inputText;
  }
}
