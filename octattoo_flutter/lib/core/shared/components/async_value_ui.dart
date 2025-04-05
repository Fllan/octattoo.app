import 'package:flutter/material.dart';
import 'package:octattoo_flutter/core/l10n_extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

extension AsyncValueUI on AsyncValue {
  void showSnackbarOnError(BuildContext context) {
    if (!isLoading && hasError) {
      final theme = Theme.of(context);
      final errorContent = _message(error);
      final snackBarContent = Text(errorContent,
          style: TextStyle(color: theme.colorScheme.onError));
      final errorSnackBar = SnackBar(
        content: snackBarContent,
        backgroundColor: theme.colorScheme.error,
        action: SnackBarAction(
          label: 'Dismiss'.hardcoded,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
    }
  }

  void showSnackbarOnSuccess(BuildContext context, String message) {
    if (!isLoading && !hasError && hasValue) {
      final theme = Theme.of(context);
      final snackBarContent =
          Text(message, style: TextStyle(color: theme.colorScheme.onPrimary));
      final successSnackBar = SnackBar(
        content: snackBarContent,
        backgroundColor: theme.colorScheme.primary,
        action: SnackBarAction(
          label: 'OK'.hardcoded,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(successSnackBar);
    }
  }

  String _message(dynamic exception) {
    // if (exception is FirebaseException) {
    //   return exception.message ?? exception.toString();
    // }
    // if (exception is PlatformException) {
    //   return exception.message ?? exception.toString();
    // }
    return exception.toString();
  }
}
