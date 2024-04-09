import 'package:logger/logger.dart';

Logger logger = Logger(
  printer: PrettyPrinter(methodCount: 1, errorMethodCount: 5, lineLength: 90),
  level: Level.off,
);

void setupLogger() {
  assert(() {
    logger = Logger(
      printer: PrettyPrinter(
        methodCount: 1,
        errorMethodCount: 5,
        lineLength: 90,
      ),
      level: Level.trace,
    );
    return true;
  }());
}