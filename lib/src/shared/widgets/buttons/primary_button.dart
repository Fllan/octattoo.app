import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
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
      child: FilledButton.icon(
        icon: icon,
        onPressed: onPressed,
        label: label,
      ),
    );
  }
}
