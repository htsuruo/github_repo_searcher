import 'package:flutter/material.dart';

class CircularIconTag extends StatelessWidget {
  const CircularIconTag({
    super.key,
    required this.iconBackgroundColor,
    required this.iconData,
    this.isDense = false,
  });

  final Color iconBackgroundColor;
  final IconData iconData;
  final bool isDense;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Container(
      padding: EdgeInsets.all(isDense ? 1 : 6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: iconBackgroundColor,
      ),
      child: Icon(
        iconData,
        size: isDense ? 10 : 16,
        color: colorScheme.surface,
      ),
    );
  }
}
