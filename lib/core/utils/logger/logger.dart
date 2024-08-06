import 'package:logger/logger.dart';

Logger logger = Logger(
  printer: PrettyPrinter(methodCount: 1, errorMethodCount: 5, lineLength: 90),
  level: Level.off,
);

/// A utility class for initializing and configuring the application logger.
///
/// This class provides a static method to set up the logger with custom settings
/// for debugging and error logging. The logger is configured to print method calls,
/// error details, and other useful information in a readable format.
///
/// ### Key Components:
/// - **Logger Setup**: Configures the logger with pretty printing, method counts, line length,
///   and other settings for detailed log output.
/// - **Debug Mode**: Enables detailed logging settings only in debug mode using an assert statement.
class LoggerInitializer {
  /// Sets up the logger with custom configurations for debugging and error logging.
  ///
  /// This method uses an assert statement to configure the logger with detailed settings
  /// only in debug mode. The logger includes method counts, error details, line length,
  /// color output, emojis, and timestamps.
  static void setupLogger() {
    assert(() {
      logger = Logger(
        printer: PrettyPrinter(
          methodCount: 1,
          errorMethodCount: 5,
          lineLength: 120,
          colors: true,
          printEmojis: true,
          dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
        ),
        level: Level.trace,
      );
      return true;
    }());
  }
}
