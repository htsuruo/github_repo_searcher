import 'package:flutter/material.dart';
import 'package:github_repo_searcher/common/common.dart';
import 'package:github_repo_searcher/gen/assets.gen.dart';

class RepoNotFound extends StatelessWidget {
  const RepoNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.icNotFound.image(height: 200),
          Text(context.l10n.repositoryNotFound),
        ],
      ),
    );
  }
}
