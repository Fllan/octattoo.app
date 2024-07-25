import 'package:octattoo_app_mvp/core/utils/dotenv/dotenv.dart';
import 'package:octattoo_app_mvp/core/utils/logger/logger.dart';

/// A class that initializes all the utils required for the app.
/// This class should be called before the app is run.
///
/// This class initializes the following utils:
/// - Logger
/// - Dotenv
class UtilsInitializer {
  static Future<void> initializeAllUtils() async {
    // Initialize Logger
    LoggerInitializer.setupLogger();

    // Initialize Dotenv
    await DotenvInitializer.loadEnv();

    logger.i('All Utils Initialized Successfully!');
  }
}
