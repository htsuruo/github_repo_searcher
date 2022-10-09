import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_repo_searcher/common/common.dart';
import 'package:github_repo_searcher/features/base/scroll_provider.dart';
import 'package:github_repo_searcher/gen/assets.gen.dart';

import 'bottom_navigation_type.dart';

class BasePage extends ConsumerStatefulWidget {
  const BasePage({super.key});

  @override
  ConsumerState<BasePage> createState() => _BasePageState();
}

class _BasePageState extends ConsumerState<BasePage> {
  final types = BottomNavigationType.values;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return UnfocusOnTap(
      child: Scaffold(
        appBar: AppBar(
          title: const _GitHubLogo(),
        ),
        body: IndexedStack(
          index: currentIndex,
          children: types.map((type) => type.page).toList(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            if (currentIndex == index) {
              ref
                  .read(scrollProvider(BottomNavigationType.values[index]))
                  .animateToTop();
            }
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
