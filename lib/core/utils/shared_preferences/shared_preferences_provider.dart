import 'package:octattoo_app_mvp/core/utils/logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shared_preferences_provider.g.dart';

/// Provides an instance of [SharedPreferences] and handles its initialization.
///
/// This provider ensures that SharedPreferences is properly initialized and available for
/// use throughout the application. It logs the initialization status and handles any
/// errors that may occur during the process.
///
/// ### Key Components:
/// - **Initialization**: Attempts to initialize SharedPreferences and logs the result.
/// - **Error Handling**: Catches and logs any errors that occur during initialization.
@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPreferences(SharedPreferencesRef ref) async {
  try {
    final sharedPreferences = await SharedPreferences.getInstance();
    logger.d('SharedPreferences initialized successfully');
    return sharedPreferences;
  } catch (e) {
    logger.e('Failed to get SharedPreferences: $e');
    rethrow;
  }
}
