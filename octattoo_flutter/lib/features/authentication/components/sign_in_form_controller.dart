import 'package:flutter/material.dart';
import 'package:octattoo_flutter/features/authentication/providers/auth_state_notifier_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_form_controller.g.dart';

@riverpod
class SignInFormController extends _$SignInFormController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  void submit({
    required String email,
    required String password,
  }) {
    ref.read(authStateNotifierProvider.notifier).loginWithEmail(
          email,
          password,
        );
  }

  bool formValidator({
    required String emailField,
    required String passwordField,
    required GlobalKey<FormState> formKey,
  }) {
    if (emailField.isNotEmpty &&
        passwordField.isNotEmpty &&
        formKey.currentState != null) {
      if (formKey.currentState!.validate()) {
        return true;
      }
    }
    return false;
  }
}
