import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:octattoo_app_mvp/core/utils/logger/logger.dart';

/// A utility class for initializing and loading environment variables using Dotenv.
///
/// This class provides a static method to load environment variables from a .env file,
/// logging the result of the operation. It ensures that configuration settings and
/// sensitive information can be securely loaded and accessed within the application.
///
/// ### Key Components:
/// - **Dotenv Loading**: Loads environment variables from a specified .env file.
/// - **Error Handling**: Catches and logs any errors that occur during the loading process.
class DotenvInitializer {
  /// Loads the environment variables from the .env file.
  ///
  /// This method attempts to load the environment variables using the `flutter_dotenv` package.
  /// It logs a success message if the file is loaded successfully, and an error message if it fails.
  static Future<void> loadEnv() async {
    try {
      await dotenv.load(fileName: '.env');
      logger.d('Loaded .env file');
    } on Exception catch (e) {
      logger.e('Failed to load .env file: $e');
    }
  }
}
