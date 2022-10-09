import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_repo_searcher/common/common.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>(
  ThemeModeNotifier.new,
);

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier(this._ref) : super(_defaultTheme) {
    try {
      state = ThemeMode.values.byName(
        _prefs.getString(PreferenceKey.appThemeMode.name) ?? '',
      );
      // ignore: avoid_catches_without_on_clauses
    } catch (_) {
      state = _defaultTheme;
    }
  }
  final Ref _ref;
  SharedPreferences get _prefs => _ref.read(sharedPreferencesProvider);
  static const _defaultTheme = ThemeMode.system;

  void select(ThemeMode themeMode) {
    state = themeMode;
    _prefs.setString(
      PreferenceKey.appThemeMode.name,
      themeMode.name,
    );
  }
}
