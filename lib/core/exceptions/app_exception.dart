import 'package:firebase_auth/firebase_auth.dart';
import 'package:octattoo_app/core/l10n/utils/localization_extensions.dart';
import 'package:octattoo_app/core/utils/logger.dart';

String defaultAuthErrorMessage = 'Authentication Error Occured'.hardcoded;
String defaultInternalErrorMessage = 'Internal Error Occured'.hardcoded;

/// A custom exception class that provides additional information about an error.
class AppException implements Exception {
  AppException({
    required this.title,
    this.code,
    required this.message,
    required this.originalException,
  });

  final String title;
  final String? code;
  final String message;
  final Exception originalException;

  @override
  String toString() {
    return 'AppException(title: $title, code: $code, message: $message, originalException: $originalException)';
  }
}

/// Converts any [Exception] to an [AppException].
///
/// Handles [FirebaseAuthException] and [FirebaseException] specifically, and provides a generic catch-all case for other exceptions.
AppException convertToAppException(
    {required String title, required Exception exception}) {
  logger.e("Converting exception: $exception");
  if (exception is FirebaseAuthException) {
    return AppException(
        title: title,
        message: exception.message ?? defaultAuthErrorMessage,
        originalException: exception,
        code: exception.code);
  }

  if (exception is FirebaseException) {
    return AppException(
        title: title,
        code: exception.code,
        message: exception.message ?? defaultInternalErrorMessage,
        originalException: exception);
  }

  // Generic catch-all case
  return AppException(
    title: title,
    message: 'An error occurred'.hardcoded,
    originalException: exception,
  );
}
