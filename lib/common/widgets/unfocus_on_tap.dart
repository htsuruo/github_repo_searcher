import 'package:flutter/material.dart';

// ref. https://github.com/HTsuruo/flutter_tsuruo_kit/blob/main/lib/widgets/unfocus_on_tap.dart
class UnfocusOnTap extends StatelessWidget {
  const UnfocusOnTap({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: child,
    );
  }
}
