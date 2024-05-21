import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/src/features/onboarding/data/firestore_user_repository.dart';
import 'package:octattoo_app/src/features/onboarding/domain/repositories/user_repository.dart';

/// A provider for the UserRepository.
final userRepositoryProvider = Provider<UserRepository>((ref) {
  // Using Singleton pattern to ensure only one instance of FirestoreUserRepository is created.
  return FirestoreUserRepository.instance;
});