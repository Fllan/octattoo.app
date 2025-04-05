import 'package:flutter/material.dart';
import 'package:octattoo_flutter/features/authentication/providers/auth_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_form_controller.g.dart';

@riverpod
class SignInFormController extends _$SignInFormController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  Future<bool> submit({required String email, required String password}) async {
    final authRepository = ref.read(authServiceProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () => authRepository.loginWithEmail(email: email, password: password));
    return state.hasError == false;
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
