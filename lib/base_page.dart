import 'package:flutter/material.dart';
import 'package:github_repo_searcher/bottom_navigation_type.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(types[currentIndex].label(context)),
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
