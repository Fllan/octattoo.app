import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    this.icon,
    this.onPressed,
    required this.label,
  });

  final Icon? icon;
  final void Function()? onPressed;
  final Widget label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: OutlinedButton.icon(
        icon: icon,
        onPressed: onPressed,
        label: label,
      ),
    );
  }
}
