import 'package:octattoo_flutter/core/providers/session_manager_provider.dart';
import 'package:octattoo_flutter/features/authentication/models/auth_state.dart';
import 'package:octattoo_flutter/features/authentication/providers/auth_service_provider.dart';
import 'package:octattoo_flutter/features/user/providers/user_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  @override
  AuthState build() {
    return AuthStateBooting();
  }

  Future<void> init() async {
    await ref.read(sessionManagerProvider).initialize();

    final userInfoResult = ref.read(authServiceProvider).currentUserInfo();
    userInfoResult.fold((error) {
      state = AuthStateError(error: error);
    }, (userInfo) async {
      if (userInfo != null) {
        final userResult = await ref.read(userServiceProvider).currentUser();
        userResult.fold((error) {
          state = AuthStateError(error: error);
        }, (user) {
          if (user == null) {
            state = AuthStateGuest();
          } else {
            state = AuthStateSuccess(user: user);
          }
        });
      } else {
        state = AuthStateGuest();
      }
    });
  }

  Future<void> loginWithEmail({
    required String email,
    required String password,
  }) async {
    final userInfoResult = await ref
        .read(authServiceProvider)
        .loginWithEmail(email: email, password: password);
    userInfoResult.fold(
      (error) {
        state = AuthStateError(error: error);
      },
      (userInfo) async {
        final userResult = await ref.read(userServiceProvider).currentUser();
        userResult.fold((error) {
          state = AuthStateError(error: error);
        }, (user) {
          if (user == null) {
            state = AuthStateGuest();
          } else {
            state = AuthStateSuccess(user: user);
          }
        });
      },
    );
  }

  Future<void> logout() async {
    final result = await ref.read(authServiceProvider).logout();
    result.fold((error) {
      state = AuthStateError(error: error);
    }, (_) {
      state = AuthStateGuest();
    });
  }
}
