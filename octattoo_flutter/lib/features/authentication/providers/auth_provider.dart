import 'package:octattoo_client/octattoo_client.dart';
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
    print("1");
    await ref.read(sessionManagerProvider).initialize();
    print("1 : Session initialized");
    print("2");

    final userInfoResult = ref.read(authServiceProvider).currentUserInfo();
    userInfoResult.fold(
      (error) {
        state = AuthStateError(error: error);
      },
      (userInfo) async {
        if (userInfo != null) {
          final userResult = await ref.read(userServiceProvider).currentUser();
          userResult.fold(
            (error) {
              state = AuthStateError(error: error);
            },
            (user) {
              state = AuthStateSuccess(user: user);
            },
          );
        } else {
          state = AuthStateGuest();
        }
      },
    );
  }

  void setUser(User user) {
    state = AuthStateSuccess(user: user);
  }

  void logoutUser() {
    state = AuthStateGuest();
  }
}
