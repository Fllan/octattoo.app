import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
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

  String _message(dynamic exception) {
    if (exception is FirebaseException) {
      return exception.message ?? exception.toString();
    }
    if (exception is PlatformException) {
      return exception.message ?? exception.toString();
    }
    return exception.toString();
  }
}
