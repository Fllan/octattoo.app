import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final asyncButtonLoadingProvider = StateProvider.family<bool, String>((ref, uniqueKey) => false);

class AsyncButton extends ConsumerWidget {
  final Future<void> Function() onPressed;
  final String label;
  final IconData? icon; // Optional icon data
  final String uniqueKey; // A unique key to identify the state of each AsyncButton

  const AsyncButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    required this.uniqueKey, // Require a unique key for each AsyncButton instance
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    // Use the uniqueKey to access the correct provider instance
    final isLoading = ref.watch(asyncButtonLoadingProvider(uniqueKey));
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
    // Use the uniqueKey to access the correct provider instance
    ref.read(asyncButtonLoadingProvider(uniqueKey).notifier).state = true;
    try {
      await onPressed();
    } finally {
      ref.read(asyncButtonLoadingProvider(uniqueKey).notifier).state = false;
    }
  }
}
