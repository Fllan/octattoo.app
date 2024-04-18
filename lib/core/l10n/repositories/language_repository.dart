import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/l10n/models/language.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:octattoo_app/core/utils/logger.dart';

class LanguageRepository {
  final Ref ref;

  LanguageRepository({required this.ref});

  static const String languageCodeKey = "language_code";

  Future<void> setLanguage(Language language) async {
    final pref = await ref.read(sharedPreferencesProvider.future);
    await pref.setString(languageCodeKey, language.code);
    logger.i("Language set to: ${language.name} (${language.code})");
  }

  Future<Language> getLanguage() async {
    final pref = await ref.read(sharedPreferencesProvider.future);
    final code = pref.getString(languageCodeKey);
    logger.i("Retrieved language code: $code");
    return Language.values.firstWhere(
      (value) => value.code == code,
      orElse: () => Language.english,
    );
  }
}

final sharedPreferencesProvider = FutureProvider<SharedPreferences>(
    (ref) async => SharedPreferences.getInstance());
final languageRepositoryProvider =
    Provider<LanguageRepository>((ref) => LanguageRepository(ref: ref));
