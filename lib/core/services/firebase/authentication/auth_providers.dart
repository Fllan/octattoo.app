import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/services/firebase/authentication/anonymous_auth_service.dart';
import 'package:octattoo_app/core/services/firebase/authentication/auth_service.dart';
import 'package:octattoo_app/core/services/firebase/authentication/email_auth_service.dart';
import 'package:octattoo_app/core/services/firebase/authentication/google_auth_service.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final authServiceProvider = Provider<AuthService>((ref) => AuthService(ref.read(firebaseAuthProvider)));
final emailAuthProvider = Provider<EmailAuthService>((ref) => EmailAuthService(ref.read(firebaseAuthProvider)));
final googleAuthProvider = Provider<GoogleAuthService>((ref) => GoogleAuthService(ref.read(firebaseAuthProvider)));
final anonymousAuthProvider = Provider<AnonymousAuthService>((ref) => AnonymousAuthService(ref.read(firebaseAuthProvider),ref));