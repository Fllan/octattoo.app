import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/constants/gaps.dart';
import 'package:octattoo_app/core/constants/theme_methods.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/core/theme/theme_controller.dart';

class ImageSelectionMenu extends ConsumerWidget {
  const ImageSelectionMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeController = ref.read(themeControllerProvider.notifier);

    return PopupMenuButton<ColorImage>(
      tooltip: 'Select an image theme'.hardcoded,
      iconColor: Theme.of(context).colorScheme.onSurface,
      icon: const Icon(Icons.image_outlined),
      onSelected: (colorImage) {
        themeController.selectImage(colorImage);
      },
      itemBuilder: (context) {
        return ColorImage.values.map((colorImage) {
          return PopupMenuItem<ColorImage>(
            value: colorImage,
            child: Row(
              children: [
                Image.network(
                  colorImage.url,
                  width: 24,
                  height: 24,
                  fit: BoxFit.cover,
                ),
                gapW8,
                Text(colorImage.label),
              ],
            ),
          );
        }).toList();
      },
    );
  }
}
