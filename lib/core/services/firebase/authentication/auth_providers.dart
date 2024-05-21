import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/services/firebase/authentication/anonymous_auth_service.dart';
import 'package:octattoo_app/core/services/firebase/authentication/auth_service.dart';
import 'package:octattoo_app/core/services/firebase/authentication/email_auth_service.dart';
import 'package:octattoo_app/core/services/firebase/authentication/google_auth_service.dart';

/// Provides an instance of [FirebaseAuth]
final firebaseAuthProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

/// Provides an instance of [AuthService]
final authServiceProvider = Provider.autoDispose<AuthService>((ref) => AuthService(ref.read(firebaseAuthProvider)));

/// Provides an instance of [EmailAuthService]
final emailAuthProvider = Provider.autoDispose<EmailAuthService>((ref) => EmailAuthService(ref.read(firebaseAuthProvider)));

/// Provides an instance of [GoogleAuthService]
final googleAuthProvider = Provider.autoDispose<GoogleAuthService>((ref) => GoogleAuthService(ref.read(firebaseAuthProvider)));

/// Provides an instance of [AnonymousAuthService]
final anonymousAuthProvider = Provider.autoDispose<AnonymousAuthService>((ref) => AnonymousAuthService(ref.read(firebaseAuthProvider),ref));