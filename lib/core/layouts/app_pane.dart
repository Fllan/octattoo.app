import 'package:flutter/material.dart';

class AppPane extends StatelessWidget {
  const AppPane({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Theme.of(context).colorScheme.surfaceContainer,
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 16,
            maxWidth: double.infinity,
          ),
          child: child,
        ),
      ),
    );
  }
}
