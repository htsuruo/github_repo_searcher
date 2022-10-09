import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_repo_searcher/features/base/bottom_navigation_type.dart';

final scrollProvider = Provider.family<ScrollHandler, BottomNavigationType>(
  (ref, _) => ScrollHandler(),
);

class ScrollHandler {
  final controller = ScrollController();

  void animateToTop() {
    controller.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
