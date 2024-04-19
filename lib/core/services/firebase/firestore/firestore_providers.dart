import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/src/features/onboarding/data/firestore_user_repository.dart';
import 'package:octattoo_app/src/features/onboarding/domain/repositories/user_repository.dart';

final appUserRepositoryProvider = Provider<UserRepository>((ref) {
  return FirestoreUserRepository();
});
