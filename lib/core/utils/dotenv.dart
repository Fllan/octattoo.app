import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:octattoo_app_mvp/core/utils/logger.dart';

/// Initialize Dotenv
class DotenvInitializer {
  static Future<void> loadEnv() async {
    try {
      await dotenv.load(fileName: '.env');
      logger.i('Loaded .env file');
    } on Exception catch (e) {
      logger.e('Failed to load .env file: $e');
    }
  }
}
