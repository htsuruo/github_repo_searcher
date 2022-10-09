import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_repo_searcher/logger.dart';

final searchBarController = StateNotifierProvider<SearchBarNotifier, String>(
  (ref) => SearchBarNotifier(),
);

const _initialQuery = 'flutter';

class SearchBarNotifier extends StateNotifier<String> {
  SearchBarNotifier() : super(_initialQuery) {
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
