import 'package:flutter/material.dart';

class RepoSearchBar extends StatelessWidget {
  const RepoSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return TextFormField(
      autocorrect: false,
      autofocus: true,
      style: theme.textTheme.bodyMedium!.copyWith(
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        constraints: const BoxConstraints(
          maxHeight: 40,
        ),
        hintText: '検索',
        hintStyle: theme.textTheme.bodyMedium!.copyWith(
          color: Colors.grey,
        ),
        filled: true,
        fillColor: colorScheme.primary.withOpacity(.1),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }
}
