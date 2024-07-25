import 'package:octattoo_app_mvp/core/utils/shared_preferences/shared_preferences_keys.dart';
import 'package:octattoo_app_mvp/core/utils/shared_preferences/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences_repository.g.dart';

/// A repository class for managing data in SharedPreferences.
///
/// This class provides methods to save, retrieve, and remove different types of data (String, int, bool)
/// from SharedPreferences. It also includes specific methods for managing onboarding steps.
class SharedPreferencesRepository {
  SharedPreferencesRepository(this._prefs);

  final SharedPreferences _prefs;

  /// Saves a string value to SharedPreferences.
  ///
  /// - **key**: The key under which the value is stored.
  /// - **value**: The string value to store.
  Future<void> saveString(SharedPreferencesKeys key, String value) async {
    await _prefs.setString(key.toString(), value);
  }

  /// Retrieves a string value from SharedPreferences.
  ///
  /// - **key**: The key under which the value is stored.
  /// - Returns: The string value, or null if not found.
  String? getString(SharedPreferencesKeys key) {
    return _prefs.getString(key.toString());
  }

  /// Saves an int value to SharedPreferences.
  ///
  /// - **key**: The key under which the value is stored.
  /// - **value**: The int value to store.
  Future<void> saveInt(SharedPreferencesKeys key, int value) async {
    await _prefs.setInt(key.toString(), value);
  }

  /// Retrieves an int value from SharedPreferences.
  ///
  /// - **key**: The key under which the value is stored.
  /// - Returns: The int value, or null if not found.
  int? getInt(SharedPreferencesKeys key) {
    return _prefs.getInt(key.toString());
  }

  /// Saves a bool value to SharedPreferences.
  ///
  /// - **key**: The key under which the value is stored.
  /// - **value**: The bool value to store.
  Future<void> saveBool(SharedPreferencesKeys key, bool value) async {
    await _prefs.setBool(key.toString(), value);
  }

  /// Retrieves a bool value from SharedPreferences.
  ///
  /// - **key**: The key under which the value is stored.
  /// - Returns: The bool value, or null if not found.
  bool? getBool(SharedPreferencesKeys key) {
    return _prefs.getBool(key.toString());
  }

  /// Removes a value from SharedPreferences.
  ///
  /// - **key**: The key under which the value is stored.
  Future<void> remove(SharedPreferencesKeys key) async {
    await _prefs.remove(key.toString());
  }

  /// Retrieves the current onboarding step from SharedPreferences.
  ///
  /// - Returns: The current onboarding step as an int, or null if not found.
  int? getCurrentOnboardingStep() {
    return _prefs.getInt(SharedPreferencesKeys.onboardingStep.toString());
  }
}

/// Provides an instance of [SharedPreferencesRepository] using Riverpod.
///
/// This provider ensures that the [SharedPreferencesRepository] is properly initialized
/// and available for use throughout the application.
@riverpod
SharedPreferencesRepository sharedPreferencesRepository(
    SharedPreferencesRepositoryRef ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider).requireValue;
  return SharedPreferencesRepository(sharedPreferences);
}
