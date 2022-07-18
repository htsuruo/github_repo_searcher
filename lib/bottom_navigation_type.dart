import 'package:flutter/material.dart';
import 'package:github_repo_searcher/extension.dart';

enum BottomNavigationType {
  /// 検索
  search,

  /// 設定
  settings,
  ;

  // MEMO(tsuruoka): BuildContextを引っ張ってくるかWidget層で定義するべきか悩ましい
  String label(BuildContext context) {
    switch (this) {
      case search:
        return context.l10n.repoSearch;
      case settings:
        return context.l10n.settings;
    }
  }

  IconData get iconData {
    switch (this) {
      case BottomNavigationType.search:
        return Icons.search;
      case BottomNavigationType.settings:
        return Icons.settings;
    }
  }
}
