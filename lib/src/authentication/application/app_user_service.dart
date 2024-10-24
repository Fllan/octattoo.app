import 'package:octattoo_app/src/authentication/data/firebase_app_user_repository.dart';
import 'package:octattoo_app/src/authentication/data/firebase_auth_repository.dart';
import 'package:octattoo_app/src/authentication/domain/app_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_user_service.g.dart';

class AppUserService {
  AppUserService(this.authRepository, this.appUserRepository);

  final AuthRepository authRepository;
  final AppUserRepository appUserRepository;

  Future<AppUser?> currentAppUser() async {
    final firebaseUser = authRepository.currentUser;
    if (firebaseUser != null) {
      return await appUserRepository.get(firebaseUser.uid);
    }
    return null;
  }

  Future<void> signOut() => authRepository.signOut();

  Future<void> signInAnonymously() async {
    await authRepository.signInAnonymously();
    final user = authRepository.currentUser;
    if (user != null) {
      await appUserRepository.add(user);
    }
  }

  Future<void> createAppUserWithEmailAndPassword(
      String email, String password) async {
    await authRepository.createUserWithEmailAndPassword(email, password);
    final user = authRepository.currentUser;
    if (user != null) {
      await appUserRepository.add(user);
    }
  }
}

@Riverpod(keepAlive: true)
AppUserService appUserService(AppUserServiceRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  final appUserRepository = ref.watch(appUserRepositoryProvider);
  return AppUserService(authRepository, appUserRepository);
}

@riverpod
class CurrentAppUser extends _$CurrentAppUser {
  @override
  Future<AppUser?> build() async {
    final appUserService = ref.watch(appUserServiceProvider);
    return appUserService.currentAppUser();
  }

  // Add methods to mutate the state
}
