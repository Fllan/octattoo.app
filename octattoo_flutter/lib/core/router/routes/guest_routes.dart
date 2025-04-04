import 'package:flutter/material.dart';
import 'package:octattoo_flutter/features/authentication/screens/register_screen.dart';
import 'package:octattoo_flutter/features/authentication/screens/reset_password_screen.dart';
import 'package:octattoo_flutter/features/authentication/screens/sign_in_screen.dart';

enum GuestRoutes {
  signIn(
    'sign-in',
    '/sign-in',
    SignInScreen(),
  ),
  forgotPassword(
    'forgot-password',
    'forgot-password',
    ResetPasswordScreen(),
  ),
  register(
    'register',
    '/register',
    RegisterScreen(),
  );

  const GuestRoutes(
    this.name,
    this.path,
    this.screen,
  );

  final String name;
  final String path;
  final Widget screen;
}
