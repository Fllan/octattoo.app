import 'package:flutter/material.dart';

class TertiaryButton extends StatelessWidget {
  const TertiaryButton({
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
      child: TextButton.icon(
        icon: icon,
        onPressed: onPressed,
        label: label,
      ),
    );
  }
}
