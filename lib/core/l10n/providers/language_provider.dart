import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/l10n/models/language.dart';
import 'package:octattoo_app/core/l10n/repositories/language_repository.dart';

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
    final lang = await repository.getLanguage();
    state = lang;
  }

  void setLanguage(Language language) async {
    await repository.setLanguage(language);
    state = language;
  }
}
