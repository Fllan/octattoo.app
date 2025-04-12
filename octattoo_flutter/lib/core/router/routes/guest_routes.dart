import 'package:flutter/material.dart';
import 'package:octattoo_flutter/features/authentication/screens/register_with_email_screen.dart';
import 'package:octattoo_flutter/features/authentication/screens/password_reset_request_screen.dart';
import 'package:octattoo_flutter/features/authentication/screens/sign_in_with_email_screen.dart';
import 'package:octattoo_flutter/features/authentication/screens/verification_code_screen.dart';

enum GuestRoutes {
  signIn(
    'sign-in',
    '/sign-in',
    SignInWithEmailScreen(),
  ),
  forgotPassword(
    'forgot-password',
    '/forgot-password',
    PasswordResetRequestScreen(),
  ),
  register(
    'register',
    '/register',
    RegisterWithEmailScreen(),
  ),
  verificationCode(
    'verification-code',
    '/verification-code',
    VerificationCodeScreen(),
  ),
  resetPassword(
    'reset-password',
    '/reset-password',
    PasswordResetRequestScreen(),
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
