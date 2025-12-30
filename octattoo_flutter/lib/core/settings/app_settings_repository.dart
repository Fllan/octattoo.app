import 'app_settings.dart';

/// Abstract repository for settings persistence.
/// Allows swapping implementations (memory -> SharedPreferences -> backend).
abstract class AppSettingsRepository {
  Future<AppSettings> loadSettings();
  Future<void> saveSettings(AppSettings settings);
}
