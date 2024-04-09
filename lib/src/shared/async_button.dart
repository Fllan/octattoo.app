import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final asyncButtonLoadingProvider = StateProvider<bool>((ref) => false);

class AsyncButton extends ConsumerWidget {
  final Future<void> Function() onPressed;
  final String label;
  final IconData? icon; // Optional icon data

  const AsyncButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isLoading = ref.watch(asyncButtonLoadingProvider);
    final buttonStyle = ElevatedButton.styleFrom(
      shape: const StadiumBorder(),
    );

    Widget buttonChild = isLoading
        ? const CircularProgressIndicator(
            strokeWidth: 2.0,
            color: Colors.white,
          )
        : icon != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, color: theme.colorScheme.onPrimary),
                  const SizedBox(width: 8), // Space between icon and text
                  Text(label),
                ],
              )
            : Text(label);

    return ElevatedButton(
      style: buttonStyle,
      onPressed: isLoading ? null : () => _handlePressed(context, ref),
      child: buttonChild,
    );
  }

  Future<void> _handlePressed(BuildContext context, WidgetRef ref) async {
    ref.read(asyncButtonLoadingProvider.notifier).state = true;
    try {
      await onPressed();
    } finally {
      ref.read(asyncButtonLoadingProvider.notifier).state = false;
    }
  }
}
