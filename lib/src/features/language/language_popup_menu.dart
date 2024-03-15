import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/src/constants/sizes.dart';
import 'package:octattoo_app/src/features/language/data/language_repository.dart';
import 'package:octattoo_app/src/features/language/language.dart';

class LanguagePopupMenu extends ConsumerWidget {
  const LanguagePopupMenu(BuildContext context, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(languageProvider);
    return PopupMenuButton<Language>(
      onSelected: (value) =>
          ref.read(languageRepositoryProvider).setLanguage(value),
      itemBuilder: (context) => [
        for (var value in Language.values)
          PopupMenuItem(
              value: value,
              child: Row(
                children: [Text(value.flag), gapW8, Text(value.name)],
              ))
      ],
      child: Text('${language.name} ${language.flag}'),
    );
  }
}
