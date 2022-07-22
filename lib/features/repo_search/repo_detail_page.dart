import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RepoDetailPage extends ConsumerWidget {
  const RepoDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repo Detail Page'),
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () => context.pop(),
        ),
      ),
    );
  }
}
