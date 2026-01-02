import 'dart:developer' as developer;

/// Base repository class providing common functionality for data access.
///
/// Repositories are responsible for:
/// - Abstracting data sources (API, local storage, etc.)
/// - Providing a clean API for data operations
/// - Handling data transformation between external and domain models
/// - Implementing caching strategies if needed
///
/// Repositories should NOT:
/// - Contain presentation logic
/// - Depend on ViewModels
/// - Handle UI state management
abstract class BaseRepository {
  /// Log repository operations for debugging
  void log(String message, {Object? error, StackTrace? stackTrace}) {
    developer.log(
      message,
      name: runtimeType.toString(),
      error: error,
      stackTrace: stackTrace,
      level: error != null ? 1000 : 800,
    );
  }

  /// Execute an operation with error logging
  Future<T> executeWithLogging<T>(
    Future<T> Function() operation,
    String operationName,
  ) async {
    try {
      log('Starting: $operationName');
      final result = await operation();
      log('Completed: $operationName');
      return result;
    } catch (e, s) {
      log('Failed: $operationName', error: e, stackTrace: s);
      rethrow;
    }
  }
}
