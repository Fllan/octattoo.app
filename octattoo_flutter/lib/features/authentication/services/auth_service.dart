import 'package:fpdart/fpdart.dart';
import 'package:octattoo_client/octattoo_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:serverpod_auth_client/serverpod_auth_client.dart';

class AuthService {
  final Client client;
  final SessionManager sessionManager;

  const AuthService(this.client, this.sessionManager);

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
