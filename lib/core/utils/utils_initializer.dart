import 'package:octattoo_app_mvp/core/utils/dotenv/dotenv.dart';
import 'package:octattoo_app_mvp/core/utils/logger/logger.dart';

class UtilsInitializer {
  static Future<void> initializeAllUtils() async {
    logger.i('Initializing Utils...');

    /// Initialize Logger
    LoggerInitializer.setupLogger();

    /// Initialize Dotenv
    await DotenvInitializer.loadEnv();

    logger.i('All Utils Initialized Successfully!');
  }
}
