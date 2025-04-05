import 'package:flutter/material.dart';
import 'package:octattoo_flutter/features/authentication/providers/auth_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_with_email_form_controller.g.dart';

@riverpod
class RegisterWithEmailFormController
    extends _$RegisterWithEmailFormController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  Future<bool> submitValidationCode({
    required String email,
    required String password,
    required String verificationCode,
  }) async {
    final authServive = ref.watch(authServiceProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => authServive.confirmRegisteredEmail(
          email: email,
          password: password,
          verificationCode: verificationCode,
        ));
    return state.hasError == false;
  }

  Future<bool> submitEmailForm(
      {required String email, required String password}) async {
    final authService = ref.watch(authServiceProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => authService.registerWithEmail(
          username: email,
          email: email,
          password: password,
        ));
    return state.hasError == false;
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
