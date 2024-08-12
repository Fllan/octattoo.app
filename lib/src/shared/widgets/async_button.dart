import 'package:flutter/material.dart';
import 'dart:async';

class AsyncButton extends StatelessWidget {
  const AsyncButton._({
    super.key,
    required this.callback,
    required this.label,
    required this.buttonType,
    required this.loadingStream,
  });

  final Future<void> Function() callback;
  final String label;
  final ButtonType buttonType;
  final Stream<bool> loadingStream;

  // Factory constructor for ElevatedButton
  factory AsyncButton.elevated({
    Key? key,
    required Future<void> Function() callback,
    required String label,
  }) {
    final controller = StreamController<bool>();
    return AsyncButton._(
      key: key,
      callback: () => _executeAsyncAction(callback, controller),
      label: label,
      buttonType: ButtonType.elevated,
      loadingStream: controller.stream,
    );
  }

  // Factory constructor for FilledButton
  factory AsyncButton.filled({
    Key? key,
    required Future<void> Function() callback,
    required String label,
  }) {
    final controller = StreamController<bool>();
    return AsyncButton._(
      key: key,
      callback: () => _executeAsyncAction(callback, controller),
      label: label,
      buttonType: ButtonType.filled,
      loadingStream: controller.stream,
    );
  }

  // Factory constructor for FilledTonalButton
  factory AsyncButton.tonal({
    Key? key,
    required Future<void> Function() callback,
    required String label,
  }) {
    final controller = StreamController<bool>();
    return AsyncButton._(
      key: key,
      callback: () => _executeAsyncAction(callback, controller),
      label: label,
      buttonType: ButtonType.tonal,
      loadingStream: controller.stream,
    );
  }

  // Factory constructor for OutlinedButton
  factory AsyncButton.outlined({
    Key? key,
    required Future<void> Function() callback,
    required String label,
  }) {
    final controller = StreamController<bool>();
    return AsyncButton._(
      key: key,
      callback: () => _executeAsyncAction(callback, controller),
      label: label,
      buttonType: ButtonType.outlined,
      loadingStream: controller.stream,
    );
  }

  // Factory constructor for TextButton
  factory AsyncButton.text({
    Key? key,
    required Future<void> Function() callback,
    required String label,
  }) {
    final controller = StreamController<bool>();
    return AsyncButton._(
      key: key,
      callback: () => _executeAsyncAction(callback, controller),
      label: label,
      buttonType: ButtonType.text,
      loadingStream: controller.stream,
    );
  }

  static Future<void> _executeAsyncAction(Future<void> Function() callback,
      StreamController<bool> controller) async {
    controller.add(true);
    try {
      await callback();
    } finally {
      controller.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: loadingStream,
      initialData: false,
      builder: (context, snapshot) {
        final isLoading = snapshot.data ?? false;
        final child = isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2.0),
              )
            : Text(label);

        return _buildButton(child, isLoading);
      },
    );
  }

  Widget _buildButton(Widget child, bool isLoading) {
    switch (buttonType) {
      case ButtonType.elevated:
        return ElevatedButton(
          onPressed: isLoading ? null : callback,
          child: child,
        );
      case ButtonType.filled:
        return FilledButton(
          onPressed: isLoading ? null : callback,
          child: child,
        );
      case ButtonType.tonal:
        return FilledButton.tonal(
          onPressed: isLoading ? null : callback,
          child: child,
        );
      case ButtonType.outlined:
        return OutlinedButton(
          onPressed: isLoading ? null : callback,
          child: child,
        );
      case ButtonType.text:
        return TextButton(
          onPressed: isLoading ? null : callback,
          child: child,
        );
      default:
        return ElevatedButton(
          onPressed: isLoading ? null : callback,
          child: child,
        );
    }
  }
}

enum ButtonType {
  elevated,
  filled,
  tonal,
  outlined,
  text,
}
