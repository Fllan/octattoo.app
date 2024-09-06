import 'package:flutter/material.dart';
import 'package:octattoo_app/src/authentication/presentation/forgot_password_screen.dart';
import 'package:octattoo_app/src/authentication/presentation/register_screen.dart';
import 'package:octattoo_app/src/authentication/presentation/sign_in_screen.dart';

enum AppRoutes {
  signIn(
    'sign-in',
    '/sign-in',
    SignInScreen(),
  ),
  forgotPassword(
    'forgot-password',
    'forgot-password',
    ForgotPasswordScreen(),
  ),
  register(
    'register',
    '/register',
    RegisterScreen(),
  );

  const AppRoutes(
    this.name,
    this.path,
    this.screen,
  );

  final String name;
  final String path;
  final Widget screen;
}
