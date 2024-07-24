import 'package:firebase_auth/firebase_auth.dart';
import 'package:octattoo_app_mvp/core/utils/logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_provider.g.dart';

@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) {
  try {
    final auth = FirebaseAuth.instance;
    logger.d('Firebase Authentication initialized successfully');
    return auth;
  } catch (e) {
    logger.e('Failed to initialize Firebase Authentication: $e');
    rethrow;
  }
}
