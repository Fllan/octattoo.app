import 'package:flutter/material.dart';
import 'package:octattoo_app/src/authentication/data/firebase_auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'forgot_password_form_controller.g.dart';

@riverpod
class ForgotPasswordFormController extends _$ForgotPasswordFormController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  Future<bool> submit({required String email}) async {
    final authRepository = ref.read(authRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () => authRepository.sendPasswordResetEmail(email));
    return state.hasError == false;
  }

  bool formValidator({
    required String emailField,
    required GlobalKey<FormState> formKey,
  }) {
    if (emailField.isNotEmpty && formKey.currentState != null) {
      if (formKey.currentState!.validate()) {
        return true;
      }
    }
    return false;
  }
}
