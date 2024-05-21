import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/l10n/models/language.dart';
import 'package:octattoo_app/core/services/shared_preferences/shared_preferences_provider.dart';
import 'package:octattoo_app/core/utils/logger.dart';
import 'package:octattoo_app/core/services/shared_preferences/shared_preferences_keys.dart';

/// A repository that manages the language settings.
class LanguageRepository {
  final Ref ref;

  /// Creates a [LanguageRepository].
  ///
  /// Requires a [Ref].
  LanguageRepository({required this.ref});

  /// Sets the current language and saves it in the shared preferences.
  Future<void> setLanguage(Language language) async {
    try {
      final pref = await ref.read(sharedPreferencesFutureProvider.future);
      var languageKey = SharedPreferencesKey.languageCode.toString();
      await pref.setString(languageKey, language.code);
      logger.i("Language set to: ${language.name} (${language.code})");
    } catch (e) {
      logger.e("Failed to set language: $e");
    }
  }

  /// Retrieves the current language from the shared preferences.
  Future<Language> getLanguage() async {
    try {
      final pref = await ref.read(sharedPreferencesFutureProvider.future);
      var languageKey = SharedPreferencesKey.languageCode.toString();
      final code = pref.getString(languageKey);
      logger.i("Retrieved language code: $code");
      return Language.values.firstWhere(
        (value) => value.code == code,
        orElse: () => Language.english,
      );
    } catch (e) {
      logger.e("Failed to get language: $e");
      return Language.english;
    }
  }
}

final languageRepositoryProvider =
    Provider<LanguageRepository>((ref) => LanguageRepository(ref: ref));