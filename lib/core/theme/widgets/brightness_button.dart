import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/core/theme/theme_controller.dart';

class BrightnessButton extends ConsumerWidget {
  const BrightnessButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeController = ref.read(themeControllerProvider.notifier);
    final isBright = Theme.of(context).brightness == Brightness.light;

    return IconButton(
      tooltip: 'Select brightness'.hardcoded,
      onPressed: () => themeController.toggleBrightness(),
      icon: Icon(
        isBright ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
      ),
//      icon: const Icon(Icons.dark_mode_outlined),
    );
  }
}
