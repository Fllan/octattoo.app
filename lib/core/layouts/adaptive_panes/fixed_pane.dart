import 'package:flutter/material.dart';

class FixedPane extends StatelessWidget {
  final Widget child;
  final double width;

  const FixedPane({
    super.key,
    required this.child,
    this.width = 300.0, // Default fixed width
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        color: Theme.of(context).colorScheme.surfaceContainer,
        child: Container(
          width: width,
          padding: const EdgeInsets.all(20.0),
          margin: const EdgeInsets.all(8.0),
          child: child,
        ),
      ),
    );
  }
}
