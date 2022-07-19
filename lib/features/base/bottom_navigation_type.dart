import 'package:flutter/material.dart';
import 'package:github_repo_searcher/extension.dart';
import 'package:github_repo_searcher/features/repo_search/repo_search_page.dart';
import 'package:github_repo_searcher/features/settings/settings_page.dart';

enum BottomNavigationType {
  /// リポジトリ検索
  repoSearch,

  /// 設定
  settings,
  ;

  // MEMO(tsuruoka): BuildContextを引っ張ってくるかWidget層で定義するべきか悩ましい
  String label(BuildContext context) {
    switch (this) {
      case repoSearch:
        return context.l10n.repoSearch;
      case settings:
        return context.l10n.settings;
    }
  }

  IconData get iconData {
    switch (this) {
      case repoSearch:
        return Icons.search;
      case settings:
        return Icons.settings;
    }
  }

  Widget get page {
    switch (this) {
      case repoSearch:
        return const RepoSearchPage();
      case settings:
        return const SettingsPage();
    }
  }
}
