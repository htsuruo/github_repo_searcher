import 'package:flutter/material.dart';
import 'package:github_repo_searcher/common/common.dart';
import 'package:github_repo_searcher/features/repo/repo_search_page.dart';
import 'package:github_repo_searcher/features/settings/settings_page.dart';

enum BottomNavigationType {
  /// リポジトリ検索
  repoSearch(iconData: Icons.search, page: RepoSearchPage()),

  /// 設定
  settings(iconData: Icons.settings, page: SettingsPage()),
  ;

  const BottomNavigationType({required this.iconData, required this.page});
  final IconData iconData;
  final Widget page;

  // MEMO(tsuruoka): BuildContextを引っ張ってくるかWidget層で定義するべきか悩ましい
  String label(BuildContext context) {
    switch (this) {
      case repoSearch:
        return context.l10n.repoSearch;
      case settings:
        return context.l10n.settings;
    }
  }
}
