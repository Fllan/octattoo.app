import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/l10n/models/language.dart';
import 'package:octattoo_app/core/l10n/repositories/language_repository.dart';
import 'package:octattoo_app/core/utils/logger.dart';

final languageProvider = StateNotifierProvider<LanguageNotifier, Language>((ref) {
  final repository = ref.watch(languageRepositoryProvider);
  return LanguageNotifier(repository: repository);
});

class LanguageNotifier extends StateNotifier<Language> {
  final LanguageRepository repository;

  LanguageNotifier({required this.repository}) : super(Language.english) {
    _loadInitialLanguage();
  }

  void _loadInitialLanguage() async {
    logger.d("Loading initial language setting.");
    final lang = await repository.getLanguage();
    state = lang;
    logger.d("Loaded language: ${lang.name}");
  }

  void setLanguage(Language language) async {
    logger.d("Setting language to ${language.name}");
    await repository.setLanguage(language);
    state = language;
  }
}
