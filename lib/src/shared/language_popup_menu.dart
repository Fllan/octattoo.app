import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/constants/sizes.dart';
import 'package:octattoo_app/core/l10n/providers/language_provider.dart';
import 'package:octattoo_app/core/l10n/models/language.dart';
import 'package:octattoo_app/core/utils/logger.dart';

class LanguagePopupMenu extends ConsumerWidget {
  const LanguagePopupMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton<Language>(
      onSelected: (value) {
          ref.read(languageProvider.notifier).setLanguage(value);
          logger.i("User changed language to: ${value.name} (${value.code})");
      },
      itemBuilder: (context) => [
        for (var value in Language.values)
          PopupMenuItem(
              value: value,
              child: Row(
                children: [Text(value.flag), gapW8, Text(value.name)],
              ))
      ],
      icon: const Icon(Icons.language),
    );
  }
}
