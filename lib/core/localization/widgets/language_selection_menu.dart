import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/constants/gaps.dart';
import 'package:octattoo_app/core/constants/languages.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/core/localization/language_controller.dart';

class LanguageSelectionMenu extends ConsumerWidget {
  const LanguageSelectionMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageController = ref.read(languageControllerProvider.notifier);
    return PopupMenuButton<Language>(
      tooltip: 'Select language'.hardcoded,
      iconColor: Theme.of(context).colorScheme.onSurface,
      icon: const Icon(Icons.language),
      onSelected: (language) {
        languageController.setLocale(Locale(language.code));
      },
      itemBuilder: (BuildContext context) {
        return Language.values.map((Language language) {
          return PopupMenuItem<Language>(
            value: language,
            child: Row(
              children: [
                Text(language.name),
                gapW8,
                Text(language.flag),
              ],
            ),
          );
        }).toList();
      },
    );
  }
}
