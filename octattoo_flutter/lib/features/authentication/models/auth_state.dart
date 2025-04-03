import 'package:flutter/foundation.dart';
import 'package:octattoo_client/octattoo_client.dart';

@immutable
sealed class AuthState {
  const AuthState();
}

final class AuthStateBooting extends AuthState {}

final class AuthStateGuest extends AuthState {}

final class AuthStateLoading extends AuthState {}

final class AuthStateVerificationCodeRequired extends AuthState {
  final String email;
  final String password;

  const AuthStateVerificationCodeRequired({
    required this.email,
    required this.password,
  });
}

final class AuthStateSuccess extends AuthState {
  final User user;
  const AuthStateSuccess({required this.user});
}

final class AuthStateError extends AuthState {
  final String error;
  const AuthStateError({required this.error});
}
