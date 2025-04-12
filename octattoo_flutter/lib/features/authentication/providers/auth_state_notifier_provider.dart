import 'package:octattoo_flutter/core/providers/session_manager_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:octattoo_flutter/features/authentication/models/auth_state.dart';
import 'package:octattoo_flutter/features/authentication/providers/auth_service_provider.dart';

part 'auth_state_notifier_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthStateNotifier extends _$AuthStateNotifier {
  @override
  AuthState build() {
    final sessionManager = ref.watch(sessionManagerProvider);
    if (sessionManager.isSignedIn) {
      final userInfo = sessionManager.signedInUser;
      if (userInfo != null) {
        return AuthStateSignedIn(userInfoId: userInfo.id!);
      }
    }
    return AuthStateSignedOut();
  }

  void setLoading() {
    state = AuthStateLoading();
  }

  void setError(String message) {
    state = AuthStateError(error: message);
  }

  void setAccountCreationRequested(
    String username,
    String email,
    String password,
  ) async {
    setLoading();
    await ref.read(authServiceProvider).registerWithEmail(
          username: username,
          email: email,
          password: password,
        );
    state = AuthStateAccountCreationRequested(
      username: username,
      email: email,
      password: password,
    );
  }

  void setEmailValidationPending(
    String email,
    String password,
    String verificationCode,
  ) async {
    setLoading();
    try {
      final userInfoResult =
          await ref.read(authServiceProvider).confirmRegisteredEmail(
                email: email,
                password: password,
                verificationCode: verificationCode,
              );
      state = AuthStateSignedIn(userInfoId: userInfoResult.id!);
    } catch (e) {
      setError(e.toString());
    }
  }

  void setPasswordResetRequested(String email) async {
    setLoading();
    try {
      await ref.read(authServiceProvider).sendResetPasswordEmail(email: email);
      state = AuthStatePasswordResetRequested(email: email);
    } catch (e) {
      setError(e.toString());
    }
  }

  void setPasswordResetValidation(
    String email,
    String password,
    String verificationCode,
  ) async {
    setLoading();
    try {
      await ref.read(authServiceProvider).resetPassword(
            email: email,
            password: password,
            verificationCode: verificationCode,
          );
      state = AuthStatePasswordResetValidation(
        email: email,
        verificationCode: verificationCode,
        password: password,
      );
    } catch (e) {
      setError(e.toString());
    }
  }

  Future<void> loginWithEmail(String email, String password) async {
    setLoading();
    try {
      final userInfo = await ref.read(authServiceProvider).loginWithEmail(
            email: email,
            password: password,
          );
      state = AuthStateSignedIn(userInfoId: userInfo.id!);
    } catch (e) {
      setError(e.toString());
    }
  }

  Future<void> logout() async {
    setLoading();
    try {
      await ref.read(authServiceProvider).signOutDevice();
      state = AuthStateSignedOut();
    } catch (e) {
      setError(e.toString());
    }
  }
}
