import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/l10n/models/language.dart';
import 'package:octattoo_app/core/services/shared_preferences/shared_preferences_provider.dart';
import 'package:octattoo_app/core/utils/logger.dart';
import 'package:octattoo_app/core/services/shared_preferences/shared_preferences_keys.dart';

class LanguageRepository {
  final Ref ref;

  LanguageRepository({required this.ref});

  Future<void> setLanguage(Language language) async {
    final pref = await ref.read(sharedPreferencesFutureProvider.future);
    var languageKey = SharedPreferencesKey.languageCode.toString();
    await pref.setString(languageKey, language.code);
    logger.i("Language set to: ${language.name} (${language.code})");
  }

  Future<Language> getLanguage() async {
    final pref = await ref.read(sharedPreferencesFutureProvider.future);
    var languageKey = SharedPreferencesKey.languageCode.toString();
    final code = pref.getString(languageKey);
    logger.i("Retrieved language code: $code");
    return Language.values.firstWhere(
      (value) => value.code == code,
      orElse: () => Language.english,
    );
  }
}
final languageRepositoryProvider =
    Provider<LanguageRepository>((ref) => LanguageRepository(ref: ref));
