import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/constants/gaps.dart';
import 'package:octattoo_app/core/constants/theme_methods.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/core/theme/theme_controller.dart';

class ColorSelectionMenu extends ConsumerWidget {
  const ColorSelectionMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeController = ref.read(themeControllerProvider.notifier);

    return PopupMenuButton<ColorSeed>(
      tooltip: 'Select a color theme'.hardcoded,
      iconColor: Theme.of(context).colorScheme.onSurface,
      icon: const Icon(Icons.color_lens_outlined),
      onSelected: (colorSeed) {
        themeController.selectColorSeed(colorSeed);
      },
      itemBuilder: (context) {
        return ColorSeed.values.map((colorSeed) {
          return PopupMenuItem<ColorSeed>(
            value: colorSeed,
            child: Row(
              children: [
                Icon(
                  Icons.circle,
                  color: colorSeed.color,
                ),
                gapW8,
                Text(colorSeed.label),
              ],
            ),
          );
        }).toList();
      },
    );
  }
}
