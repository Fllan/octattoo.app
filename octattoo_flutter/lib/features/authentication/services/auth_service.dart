import 'package:fpdart/fpdart.dart';
import 'package:octattoo_client/octattoo_client.dart';
// ignore: depend_on_referenced_packages
import 'package:serverpod_auth_client/serverpod_auth_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

class AuthService {
  final Client client;
  final SessionManager sessionManager;

  const AuthService(this.client, this.sessionManager);

  Either<String, UserInfo?> currentUserInfo() {
    try {
      return right(sessionManager.signedInUser);
    } on Exception catch (e, st) {
      print(e);
      print(st);
      return left(e.toString());
    }
  }

  Future<Either<String, UserInfo>> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final result =
          await client.modules.auth.email.authenticate(email, password);

      if (!result.success) {
        return left("Could not login");
      }
      if (result.userInfo == null) {
        return left("Authentication not successful");
      }
      if (result.key == null || result.keyId == null) {
        return left("No authentication token found");
      }

      await sessionManager.registerSignedInUser(
        result.userInfo!,
        result.keyId!,
        result.key!,
      );

      return right(result.userInfo!);
    } catch (e, st) {
      print(e);
      print(st);
      return left(e.toString());
    }
  }

  Future<Either<String, void>> logout() async {
    try {
      await client.modules.auth.status.signOutDevice();
      return right(null);
    } on Exception catch (e, st) {
      print(e);
      print(st);
      return left(e.toString());
    }
  }

  Future<Either<String, void>> registerWithEmail({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      final result = await client.modules.auth.email
          .createAccountRequest(username, email, password);
      if (!result) {
        return left("Could not create account.");
      }
      return right(null);
    } on Exception catch (e, st) {
      print(e);
      print(st);
      return left(e.toString());
    }
  }

  Future<Either<String, UserInfo>> confirmEmailRegister({
    required String email,
    required String verificationCode,
  }) async {
    try {
      final result = await client.modules.auth.email
          .createAccount(email, verificationCode);
      if (result == null) {
        return left("Could not create account.");
      }
      return right(result);
    } on Exception catch (e, st) {
      print(e);
      print(st);
      return left(e.toString());
    }
  }
}
