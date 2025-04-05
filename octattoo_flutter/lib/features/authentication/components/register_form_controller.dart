import 'package:flutter/material.dart';
import 'package:octattoo_flutter/features/authentication/providers/auth_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_form_controller.g.dart';

@riverpod
class RegisterFormController extends _$RegisterFormController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  Future<bool> submit({required String email, required String password}) async {
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
