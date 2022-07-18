import 'package:flutter/material.dart';
import 'package:github_repo_searcher/base_page.dart';
import 'package:github_repo_searcher/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Repo Searcher',
      themeMode: ThemeMode.dark,
      theme: Themes.light,
      darkTheme: Themes.dark,
      home: const BasePage(),
    );
  }
}
