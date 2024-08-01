import 'package:flutter/material.dart';

enum ButtonType {
  elevated,
  filled,
  filledTonal,
  outlined,
  text,
}

class AppButton extends StatelessWidget {
  final ButtonType type;
  final VoidCallback onPressed;
  final Widget child;
  final bool enabled;

  const AppButton({
    super.key,
    required this.type,
    required this.onPressed,
    required this.child,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle defaultTextStyle = Theme.of(context).textTheme.labelLarge!;

    ButtonStyle buttonStyle;

    switch (type) {
      case ButtonType.elevated:
        buttonStyle = ElevatedButton.styleFrom(
          textStyle: defaultTextStyle,
        );
        return ElevatedButton(
          onPressed: enabled ? onPressed : null,
          style: buttonStyle,
          child: child,
        );
      case ButtonType.filled:
        buttonStyle = ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          textStyle: defaultTextStyle,
        );
        return ElevatedButton(
          onPressed: enabled ? onPressed : null,
          style: buttonStyle,
          child: child,
        );
      case ButtonType.filledTonal:
        buttonStyle = ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          textStyle: defaultTextStyle.copyWith(
              color: Theme.of(context).colorScheme.onSecondaryContainer),
        );
        return ElevatedButton(
          onPressed: enabled ? onPressed : null,
          style: buttonStyle,
          child: child,
        );
      case ButtonType.outlined:
        buttonStyle = OutlinedButton.styleFrom(
          textStyle: defaultTextStyle,
          side: BorderSide(color: Theme.of(context).colorScheme.primary),
        );
        return OutlinedButton(
          onPressed: enabled ? onPressed : null,
          style: buttonStyle,
          child: child,
        );
      case ButtonType.text:
        buttonStyle = TextButton.styleFrom(
          textStyle: defaultTextStyle,
        );
        return TextButton(
          onPressed: enabled ? onPressed : null,
          style: buttonStyle,
          child: child,
        );
      default:
        buttonStyle = TextButton.styleFrom(
          textStyle: defaultTextStyle,
        );
        return TextButton(
          onPressed: enabled ? onPressed : null,
          style: buttonStyle,
          child: child,
        );
    }
  }
}
