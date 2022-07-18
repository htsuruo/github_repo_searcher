import 'package:flutter/material.dart';

enum BottomNavigationType {
  /// 検索
  search,

  /// 設定
  settings,
  ;

  String get label {
    switch (this) {
      case BottomNavigationType.search:
        return 'Repo Search';
      case BottomNavigationType.settings:
        return 'Setting';
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
