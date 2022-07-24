import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:github_repo_searcher/common/common.dart';
import 'package:github_repo_searcher/features/settings/theme_mode/theme_mode_selector.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(context.l10n.appTheme),
              const ThemeModeSelector(),
            ],
          ),
          if (kDebugMode)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('SharedPreferences Debug'),
                IconButton(
                  onPressed: () {
                    context.goNamed('shared_preferences_debug');
                  },
                  icon: const Icon(Icons.bug_report),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
