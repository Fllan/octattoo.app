import 'package:flutter/material.dart';

class FlexiblePane extends StatelessWidget {
  final Widget child;

  const FlexiblePane({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Material(
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          color: Theme.of(context).colorScheme.surfaceContainer,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.all(8.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
