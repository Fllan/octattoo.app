import 'package:octattoo_app_mvp/core/services/sharedPreferences/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences_repository.g.dart';

/// SharedPreferencesKeys is an enum that contains all the keys used to save and retrieve data from SharedPreferences.
enum SharedPreferencesKeys {
  locale,
  theme,
  onboardingStep, // 1: Artist Profile, 2: Workplace Type,
  onboardingArtistName,
  onboardingShowRealNames,
  onboardingShowPronoun,
  onboardingFirstname,
  onboardingLastname,
  onboardingPronoun,
  onboardingWorkplaceType,
}

class SharedPreferencesRepository {
  SharedPreferencesRepository(this._prefs);

  final SharedPreferences _prefs;

  Future<void> saveString(SharedPreferencesKeys key, String value) async {
    await _prefs.setString(key.toString(), value);
  }

  String? getString(SharedPreferencesKeys key) {
    return _prefs.getString(key.toString());
  }

  Future<void> saveInt(SharedPreferencesKeys key, int value) async {
    await _prefs.setInt(key.toString(), value);
  }

  int? getInt(SharedPreferencesKeys key) {
    return _prefs.getInt(key.toString());
  }

  Future<void> saveBool(SharedPreferencesKeys key, bool value) async {
    await _prefs.setBool(key.toString(), value);
  }

  bool? getBool(SharedPreferencesKeys key) {
    return _prefs.getBool(key.toString());
  }

  Future<void> remove(SharedPreferencesKeys key) async {
    await _prefs.remove(key.toString());
  }

  int? getCurrentOnboardingStep() {
    return _prefs.getInt(SharedPreferencesKeys.onboardingStep.toString());
  }
}

@riverpod
SharedPreferencesRepository sharedPreferencesRepository(
    SharedPreferencesRepositoryRef ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider).requireValue;
  return SharedPreferencesRepository(sharedPreferences);
}
