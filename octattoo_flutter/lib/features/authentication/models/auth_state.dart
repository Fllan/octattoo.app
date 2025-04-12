import 'package:flutter/foundation.dart';

@immutable
sealed class AuthState {
  const AuthState();
}

final class AuthStateInitial extends AuthState {}

final class AuthStateLoading extends AuthState {}

final class AuthStateSignedOut extends AuthState {}

final class AuthStateAccountCreationRequested extends AuthState {
  final String username;
  final String email;
  final String password;

  const AuthStateAccountCreationRequested({
    required this.username,
    required this.email,
    required this.password,
  });
}

final class AuthStateEmailValidationPending extends AuthState {
  final String email;
  final String password;
  final String verificationCode;

  const AuthStateEmailValidationPending({
    required this.email,
    required this.password,
    required this.verificationCode,
  });
}

final class AuthStatePasswordResetRequested extends AuthState {
  final String email;

  const AuthStatePasswordResetRequested({required this.email});
}

final class AuthStatePasswordResetValidation extends AuthState {
  final String email;
  final String verificationCode;
  final String password;

  const AuthStatePasswordResetValidation({
    required this.email,
    required this.verificationCode,
    required this.password,
  });
}

final class AuthStateSignedIn extends AuthState {
  final int userInfoId;
  const AuthStateSignedIn({required this.userInfoId});
}

final class AuthStateError extends AuthState {
  final String error;
  const AuthStateError({required this.error});
}
