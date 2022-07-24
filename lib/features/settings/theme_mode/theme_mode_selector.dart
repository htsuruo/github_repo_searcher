import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_repo_searcher/common/common.dart';
import 'package:github_repo_searcher/features/settings/theme_mode/theme_mode_provider.dart';

class ThemeModeSelector extends ConsumerWidget {
  const ThemeModeSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButton<ThemeMode>(
      value: ref.watch(themeModeProvider),
      items: ThemeMode.values
          .map(
            (mode) => DropdownMenuItem<ThemeMode>(
              value: mode,
              child: Text(mode.label(context)),
            ),
          )
          .toList(),
      onChanged: (mode) {
        ref.read(themeModeProvider.notifier).select(mode!);
      },
    );
  }
}

extension on ThemeMode {
  String label(BuildContext context) {
    switch (this) {
      case ThemeMode.system:
        return context.l10n.systemTheme;
      case ThemeMode.light:
        return context.l10n.lightTheme;
      case ThemeMode.dark:
        return context.l10n.darkTheme;
    }
  }
}
