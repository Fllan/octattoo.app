import 'package:octattoo_client/octattoo_client.dart';
import 'package:octattoo_flutter/core/l10n_extensions.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

class AuthService {
  final Client client;
  final SessionManager sessionManager;

  const AuthService(this.client, this.sessionManager);

  UserInfo? currentUserInfo() {
    try {
      return sessionManager.signedInUser;
    } catch (e, st) {
      print(e);
      print(st);
      throw Exception(e.toString());
    }
  }

  Future<UserInfo> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final result =
          await client.modules.auth.email.authenticate(email, password);

      if (!result.success) {
        throw Exception("Could not login".hardcoded);
      }
      if (result.userInfo == null) {
        throw Exception("Authentication not successful".hardcoded);
      }
      if (result.key == null || result.keyId == null) {
        throw Exception("No authentication token found".hardcoded);
      }

      await sessionManager.registerSignedInUser(
        result.userInfo!,
        result.keyId!,
        result.key!,
      );

      return result.userInfo!;
    } catch (e, st) {
      print(e);
      print(st);
      throw Exception(e.toString());
    }
  }

  Future<void> signOutDevice() async {
    try {
      await sessionManager.signOutDevice();
    } catch (e, st) {
      print(e);
      print(st);
      throw Exception(e.toString());
    }
  }

  Future<void> registerWithEmail({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final result = await client.modules.auth.email
          .createAccountRequest(username, email, password);
      if (!result) {
        throw Exception("Could not create account.".hardcoded);
      }
    } catch (e, st) {
      print(e);
      print(st);
      throw Exception(e.toString());
    }
  }

  Future<UserInfo> confirmRegisteredEmail({
    required String email,
    required String password,
    required String verificationCode,
  }) async {
    try {
      final creationResult = await client.modules.auth.email
          .createAccount(email, verificationCode);
      if (creationResult == null) {
        throw Exception("Could not confirm email.".hardcoded);
      }
      await loginWithEmail(email: email, password: password);
      return creationResult;
    } catch (e, st) {
      print(e);
      print(st);
      throw Exception(e.toString());
    }
  }

  Future<void> sendResetPasswordEmail({
    required String email,
  }) async {
    try {
      final result =
          await client.modules.auth.email.initiatePasswordReset(email);
      if (!result) {
        throw Exception("Could not send password reset email".hardcoded);
      }
    } catch (e, st) {
      print(e);
      print(st);
      throw Exception(e.toString());
    }
  }

  Future<void> resetPassword({
    required String email,
    required String password,
    required String verificationCode,
  }) async {
    try {
      final resetResult = await client.modules.auth.email
          .resetPassword(verificationCode, password);
      if (!resetResult) {
        throw Exception("Could not reset password".hardcoded);
      }
      await loginWithEmail(email: email, password: password);
    } catch (e, st) {
      print(e);
      print(st);
      throw Exception(e.toString());
    }
  }
}
