import 'package:flutter/material.dart';

class AppOnboardingScaffold extends StatelessWidget {
  const AppOnboardingScaffold({
    super.key,
    required this.children,
    required this.title,
  });

  final List<Widget> children;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }
}
