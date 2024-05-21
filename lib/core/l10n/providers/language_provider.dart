import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/l10n/models/language.dart';
import 'package:octattoo_app/core/l10n/repositories/language_repository.dart';
import 'package:octattoo_app/core/utils/logger.dart';

final languageProvider = StateNotifierProvider<LanguageNotifier, Language>((ref) {
  final repository = ref.watch(languageRepositoryProvider);
  return LanguageNotifier(repository: repository);
});

/// A [StateNotifier] that manages the current language of the application.
class LanguageNotifier extends StateNotifier<Language> {
  final LanguageRepository repository;

  /// Creates a [LanguageNotifier].
  ///
  /// Requires a [LanguageRepository].
  LanguageNotifier({required this.repository}) : super(Language.english) {
    _loadInitialLanguage();
  }

  /// Loads the initial language from the [LanguageRepository].
  Future<void> _loadInitialLanguage() async {
    try {
      logger.d("Loading initial language setting.");
      final lang = await repository.getLanguage();
      state = lang;
      logger.d("Loaded language: ${lang.name}");
    } catch (e) {
      logger.e("Failed to load initial language: $e");
    }
  }

  /// Sets the current language and saves it in the [LanguageRepository].
  Future<void> setLanguage(Language language) async {
    try {
      logger.d("Setting language to ${language.name}");
      await repository.setLanguage(language);
      state = language;
    } catch (e) {
      logger.e("Failed to set language: $e");
    }
  }
}