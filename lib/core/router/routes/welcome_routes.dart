import 'package:flutter/material.dart';
import 'package:octattoo_app/src/authentication/presentation/register_screen.dart';
import 'package:octattoo_app/src/authentication/presentation/widgets/forgot_password_widget.dart';
import 'package:octattoo_app/src/authentication/presentation/widgets/sign_in_widget.dart';

enum WelcomeRoutes {
  signIn(
    'sign-in',
    '/sign-in',
    SignInWidget(),
  ),
  forgotPassword(
    'forgot-password',
    'forgot-password',
    ForgotPasswordWidget(),
  ),
  register(
    'register',
    '/register',
    RegisterScreen(),
  );

  const WelcomeRoutes(
    this.name,
    this.path,
    this.screen,
  );

  final String name;
  final String path;
  final Widget screen;
}
