import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// SharedPreferencesKeys is an enum that contains all the keys used to save and retrieve data from SharedPreferences.
enum SharedPreferencesKeys {
  locale,
  theme,
  onboardingStep, // 0: Start, 1: Artist Profile, 2: Workplace Type,
  onboardingArtistName,
  onboardingShowRealNames,
  onboardingShowPronoun,
  onboardingFirstname,
  onboardingLastname,
  onboardingPronoun,
  onboardingWorkplaceType,
}

/// SharedPreferencesService is a singleton class that provides methods to save and retrieve data from SharedPreferences.
class SharedPreferencesService {
  SharedPreferencesService._privateConstructor();

  static final SharedPreferencesService instance =
      SharedPreferencesService._privateConstructor();

  Future<void> saveString(SharedPreferencesKeys key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key.toString(), value);
  }

  Future<String?> getString(SharedPreferencesKeys key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key.toString());
  }

  Future<void> saveInt(SharedPreferencesKeys key, int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key.toString(), value);
  }

  Future<int?> getInt(SharedPreferencesKeys key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key.toString());
  }

  Future<void> saveBool(SharedPreferencesKeys key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key.toString(), value);
  }

  Future<bool?> getBool(SharedPreferencesKeys key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key.toString());
  }

  Future<void> remove(SharedPreferencesKeys key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key.toString());
  }
}
