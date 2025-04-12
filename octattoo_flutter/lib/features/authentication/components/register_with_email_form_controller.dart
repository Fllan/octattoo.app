import 'package:flutter/material.dart';
import 'package:octattoo_flutter/features/authentication/providers/auth_state_notifier_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_with_email_form_controller.g.dart';

@riverpod
class RegisterWithEmailFormController
    extends _$RegisterWithEmailFormController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  void submitEmailForm({
    required String email,
    required String password,
  }) async {
    final username = email;
    ref.read(authStateNotifierProvider.notifier).setAccountCreationRequested(
          username,
          email,
          password,
        );
  }

  bool formValidator({
    required String email,
    required String password,
    required String confirmedPassword,
    required GlobalKey<FormState> formKey,
  }) {
    if (email.isNotEmpty &&
        password.isNotEmpty &&
        confirmedPassword.isNotEmpty &&
        password == confirmedPassword &&
        formKey.currentState != null) {
      if (formKey.currentState!.validate()) {
        return true;
      }
    }
    return false;
  }
}
