import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/common_widgets/alert_dialog.dart';
import 'package:octattoo_app/exceptions/app_exception.dart';

extension AsyncValueX on AsyncValue {
  void showAlertDialogOnError(BuildContext context) {
    if (!isLoading && hasError) {
      if (error is AppException) {
        final AppException exception = error as AppException;
        showExceptionAlertDialog(
            context: context,
            title: exception.title,
            exception: exception.message);
      } else {
        showExceptionAlertDialog(
            context: context,
            title: 'Internal Error Occured',
            exception: error);
      }
    }
  }
}