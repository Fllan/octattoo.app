import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncButton extends ConsumerStatefulWidget {
  final Future<void> Function() onPressed;
  final String label;

  const AsyncButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  ConsumerState<AsyncButton> createState() => _AsyncButtonState();
}

class _AsyncButtonState extends ConsumerState<AsyncButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: !_isLoading ? _handlePressed : null,
      child: _isLoading
          ? SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            )
          : Text(widget.label),
    );
  }

  Future<void> _handlePressed() async {
    setState(() => _isLoading = true);
    try {
      await widget.onPressed();
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }
}
