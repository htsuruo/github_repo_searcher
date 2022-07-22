import 'package:github_repo_searcher/features/base/base_page.dart';
import 'package:github_repo_searcher/features/repo_search/repo_detail_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const BasePage(),
    ),
    GoRoute(
      path: '/repo/detail',
      builder: (context, state) => const RepoDetailPage(),
    ),
  ],
);
