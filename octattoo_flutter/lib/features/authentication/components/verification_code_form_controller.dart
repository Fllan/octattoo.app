import 'package:flutter/material.dart';
import 'package:octattoo_flutter/features/authentication/models/auth_state.dart';
import 'package:octattoo_flutter/features/authentication/providers/auth_state_notifier_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'verification_code_form_controller.g.dart';

@riverpod
class VerificationCodeFormController extends _$VerificationCodeFormController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  void submit({
    required String verificationCode,
  }) {
    print("knock knock knock !");
    final authState = ref.watch(authStateNotifierProvider);
    if (authState is AuthStateAccountCreationRequested) {
      print("who's there ??");
      final email = authState.email;
      final password = authState.password;
      ref
          .read(authStateNotifierProvider.notifier)
          .setEmailValidationPending(email, password, verificationCode);
    } else if (authState is AuthStatePasswordResetValidation) {
      final email = authState.email;
      final password = authState.password;
      ref
          .read(authStateNotifierProvider.notifier)
          .setPasswordResetValidation(email, password, verificationCode);
    }
  }

  bool formValidator({
    required String code,
    required GlobalKey<FormState> formKey,
  }) {
    if (code.isNotEmpty && formKey.currentState != null) {
      if (formKey.currentState!.validate()) {
        return true;
      }
    }
    return false;
  }
}
