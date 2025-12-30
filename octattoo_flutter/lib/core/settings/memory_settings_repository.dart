import 'app_settings.dart';
import 'app_settings_repository.dart';

/// In-memory settings storage.
/// Settings persist only during app session.
/// This is a temporary implementation until backend storage is implemented.
class MemorySettingsRepository implements AppSettingsRepository {
  AppSettings _cached = const AppSettings();

  @override
  Future<AppSettings> loadSettings() async => _cached;

  @override
  Future<void> saveSettings(AppSettings settings) async {
    _cached = settings;
  }
}
