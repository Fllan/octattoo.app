import 'package:octattoo_app_mvp/core/utils/logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shared_preferences_provider.g.dart';

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
