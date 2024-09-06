import 'package:flutter/material.dart';

class MaterialText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const MaterialText._(this.text, {required this.style, super.key});

  factory MaterialText.displayLarge(String text, BuildContext context,
      {Key? key}) {
    return MaterialText._(text,
        style: Theme.of(context).textTheme.displayLarge, key: key);
  }

  factory MaterialText.displayMedium(String text, BuildContext context,
      {Key? key}) {
    return MaterialText._(text,
        style: Theme.of(context).textTheme.displayMedium, key: key);
  }

  factory MaterialText.displaySmall(String text, BuildContext context,
      {Key? key}) {
    return MaterialText._(text,
        style: Theme.of(context).textTheme.displaySmall, key: key);
  }

  factory MaterialText.headlineLarge(String text, BuildContext context,
      {Key? key}) {
    return MaterialText._(text,
        style: Theme.of(context).textTheme.headlineLarge, key: key);
  }

  factory MaterialText.headlineMedium(String text, BuildContext context,
      {Key? key}) {
    return MaterialText._(text,
        style: Theme.of(context).textTheme.headlineMedium, key: key);
  }

  factory MaterialText.headlineSmall(String text, BuildContext context,
      {Key? key}) {
    return MaterialText._(text,
        style: Theme.of(context).textTheme.headlineSmall, key: key);
  }

  factory MaterialText.titleLarge(String text, BuildContext context,
      {Key? key}) {
    return MaterialText._(text,
        style: Theme.of(context).textTheme.titleLarge, key: key);
  }

  factory MaterialText.titleMedium(String text, BuildContext context,
      {Key? key}) {
    return MaterialText._(text,
        style: Theme.of(context).textTheme.titleMedium, key: key);
  }

  factory MaterialText.titleSmall(String text, BuildContext context,
      {Key? key}) {
    return MaterialText._(text,
        style: Theme.of(context).textTheme.titleSmall, key: key);
  }

  factory MaterialText.labelLarge(String text, BuildContext context,
      {Key? key}) {
    return MaterialText._(text,
        style: Theme.of(context).textTheme.labelLarge, key: key);
  }

  factory MaterialText.labelMedium(String text, BuildContext context,
      {Key? key}) {
    return MaterialText._(text,
        style: Theme.of(context).textTheme.labelMedium, key: key);
  }

  factory MaterialText.labelSmall(String text, BuildContext context,
      {Key? key}) {
    return MaterialText._(text,
        style: Theme.of(context).textTheme.labelSmall, key: key);
  }

  factory MaterialText.bodyLarge(String text, BuildContext context,
      {Key? key}) {
    return MaterialText._(text,
        style: Theme.of(context).textTheme.bodyLarge, key: key);
  }

  factory MaterialText.bodyMedium(String text, BuildContext context,
      {Key? key}) {
    return MaterialText._(text,
        style: Theme.of(context).textTheme.bodyMedium, key: key);
  }

  factory MaterialText.bodySmall(String text, BuildContext context,
      {Key? key}) {
    return MaterialText._(text,
        style: Theme.of(context).textTheme.bodySmall, key: key);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
