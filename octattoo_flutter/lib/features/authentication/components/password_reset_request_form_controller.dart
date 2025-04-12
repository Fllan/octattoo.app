import 'package:flutter/material.dart';
import 'package:octattoo_flutter/features/authentication/providers/auth_state_notifier_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'password_reset_request_form_controller.g.dart';

@riverpod
class PasswordResetRequestFormController
    extends _$PasswordResetRequestFormController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  void submitPasswordResetForm({required String email}) {
    ref
        .read(authStateNotifierProvider.notifier)
        .setPasswordResetRequested(email);
  }

  bool formValidator({
    required String email,
    required GlobalKey<FormState> formKey,
  }) {
    if (email.isNotEmpty && formKey.currentState != null) {
      if (formKey.currentState!.validate()) {
        return true;
      }
    }
    return false;
  }
}
