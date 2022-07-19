import 'package:flutter/material.dart';
import 'package:github_repo_searcher/gen/assets.gen.dart';
import 'package:github_repo_searcher/theme/themes.dart';

import 'bottom_navigation_type.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int currentIndex = 0;
  final types = BottomNavigationType.values;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).appColors;
    return Scaffold(
      appBar: AppBar(
        title: const _GitHubLogo(),
      ),
      body: Center(
        child: Container(
          color: appColors.background,
          width: 100,
          height: 100,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: types
            .map(
              (type) => BottomNavigationBarItem(
                icon: Icon(type.iconData),
                label: type.label(context),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _GitHubLogo extends StatelessWidget {
  const _GitHubLogo();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // GitHub Logo Guideline
    // ref. https://github.com/logos
    return Assets.githubLogo.svg(
      height: 22,
      color: theme.brightness == Brightness.light ? null : Colors.white,
    );
  }
}
