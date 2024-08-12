import 'package:flutter/material.dart';
import 'dart:async';

class AsyncButtonWithIcon extends StatelessWidget {
  const AsyncButtonWithIcon._({
    super.key,
    required this.callback,
    required this.label,
    required this.icon,
    required this.buttonType,
    required this.loadingStream,
  });

  final Future<void> Function() callback;
  final String label;
  final Icon icon;
  final ButtonType buttonType;
  final Stream<bool> loadingStream;

  // Factory constructor for ElevatedButton with Icon
  factory AsyncButtonWithIcon.elevated({
    Key? key,
    required Future<void> Function() callback,
    required String label,
    required Icon icon,
  }) {
    final controller = StreamController<bool>();
    return AsyncButtonWithIcon._(
      key: key,
      callback: () => _executeAsyncAction(callback, controller),
      label: label,
      icon: icon,
      buttonType: ButtonType.elevated,
      loadingStream: controller.stream,
    );
  }

  // Factory constructor for FilledButton with Icon
  factory AsyncButtonWithIcon.filled({
    Key? key,
    required Future<void> Function() callback,
    required String label,
    required Icon icon,
  }) {
    final controller = StreamController<bool>();
    return AsyncButtonWithIcon._(
      key: key,
      callback: () => _executeAsyncAction(callback, controller),
      label: label,
      icon: icon,
      buttonType: ButtonType.filled,
      loadingStream: controller.stream,
    );
  }

  // Factory constructor for FilledTonalButton with Icon
  factory AsyncButtonWithIcon.tonal({
    Key? key,
    required Future<void> Function() callback,
    required String label,
    required Icon icon,
  }) {
    final controller = StreamController<bool>();
    return AsyncButtonWithIcon._(
      key: key,
      callback: () => _executeAsyncAction(callback, controller),
      label: label,
      icon: icon,
      buttonType: ButtonType.tonal,
      loadingStream: controller.stream,
    );
  }

  // Factory constructor for OutlinedButton with Icon
  factory AsyncButtonWithIcon.outlined({
    Key? key,
    required Future<void> Function() callback,
    required String label,
    required Icon icon,
  }) {
    final controller = StreamController<bool>();
    return AsyncButtonWithIcon._(
      key: key,
      callback: () => _executeAsyncAction(callback, controller),
      label: label,
      icon: icon,
      buttonType: ButtonType.outlined,
      loadingStream: controller.stream,
    );
  }

  // Factory constructor for TextButton with Icon
  factory AsyncButtonWithIcon.text({
    Key? key,
    required Future<void> Function() callback,
    required String label,
    required Icon icon,
  }) {
    final controller = StreamController<bool>();
    return AsyncButtonWithIcon._(
      key: key,
      callback: () => _executeAsyncAction(callback, controller),
      label: label,
      icon: icon,
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
            : Text(label); // Only pass the label as the child

        return _buildButton(child, isLoading);
      },
    );
  }

  Widget _buildButton(Widget child, bool isLoading) {
    switch (buttonType) {
      case ButtonType.elevated:
        return ElevatedButton.icon(
          onPressed: isLoading ? null : callback,
          icon: icon,
          label: child, // Only the label is passed here
        );
      case ButtonType.filled:
        return FilledButton.icon(
          onPressed: isLoading ? null : callback,
          icon: icon,
          label: child,
        );
      case ButtonType.tonal:
        return FilledButton.tonalIcon(
          onPressed: isLoading ? null : callback,
          icon: icon,
          label: child,
        );
      case ButtonType.outlined:
        return OutlinedButton.icon(
          onPressed: isLoading ? null : callback,
          icon: icon,
          label: child,
        );
      case ButtonType.text:
        return TextButton.icon(
          onPressed: isLoading ? null : callback,
          icon: icon,
          label: child,
        );
      default:
        return ElevatedButton.icon(
          onPressed: isLoading ? null : callback,
          icon: icon,
          label: child,
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
