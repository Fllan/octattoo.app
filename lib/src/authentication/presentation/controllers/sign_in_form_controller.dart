import 'package:flutter/material.dart';
import 'package:octattoo_app/src/authentication/data/firebase_auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_form_controller.g.dart';

@riverpod
class SignInFormController extends _$SignInFormController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  Future<bool> submit({required String email, required String password}) async {
    final authRepository = ref.read(authRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () => authRepository.signInWithEmailAndPassword(email, password));
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
