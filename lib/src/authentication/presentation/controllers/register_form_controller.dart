import 'package:flutter/material.dart';
import 'package:octattoo_app/src/authentication/application/app_user_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_form_controller.g.dart';

@riverpod
class RegisterFormController extends _$RegisterFormController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  Future<bool> submit({required String email, required String password}) async {
    final appUserService = ref.watch(appUserServiceProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() =>
        appUserService.createAppUserWithEmailAndPassword(email, password));
    return state.hasError == false;
  }

  bool formValidator({
    required String emailField,
    required String passwordField,
    required String confirmedPasswordField,
    required GlobalKey<FormState> formKey,
  }) {
    if (emailField.isNotEmpty &&
        passwordField.isNotEmpty &&
        confirmedPasswordField.isNotEmpty &&
        passwordField == confirmedPasswordField &&
        formKey.currentState != null) {
      if (formKey.currentState!.validate()) {
        return true;
      }
    }
    return false;
  }
}
