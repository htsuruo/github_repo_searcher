import 'package:flutter/material.dart';
import 'package:github_repo_searcher/common/common.dart';
import 'package:github_repo_searcher/features/settings/theme_mode/theme_mode_selector.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(context.l10n.appTheme),
          const ThemeModeSelector(),
        ],
      ),
    );
  }
}
