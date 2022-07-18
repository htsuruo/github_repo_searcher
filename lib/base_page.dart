import 'package:flutter/material.dart';
import 'package:github_repo_searcher/bottom_navigation_type.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchPage'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: BottomNavigationType.values
            .map(
              (type) => BottomNavigationBarItem(
                // TODO(tsuruoka): アイコン差し替え
                icon: Icon(type.iconData),
                label: type.label,
              ),
            )
            .toList(),
      ),
    );
  }
}
