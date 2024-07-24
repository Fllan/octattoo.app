import 'package:logger/logger.dart';

Logger logger = Logger(
  printer: PrettyPrinter(methodCount: 1, errorMethodCount: 5, lineLength: 90),
  level: Level.off,
);

/// Initialize Logger
class LoggerInitializer {
  static void setupLogger() {
    assert(() {
      logger = Logger(
        printer: PrettyPrinter(
          methodCount: 1,
          errorMethodCount: 5,
          lineLength: 120,
          colors: true,
          printEmojis: true,
          printTime: true,
        ),
        level: Level.trace,
      );
      return true;
    }());
  }
}
