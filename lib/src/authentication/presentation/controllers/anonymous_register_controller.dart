import 'package:octattoo_app/src/authentication/data/firebase_auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'anonymous_register_controller.g.dart';

@riverpod
class AnonymousRegisterController extends _$AnonymousRegisterController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  Future<bool> registerAnonymously() async {
    final authRepository = ref.read(authRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => authRepository.signInAnonymously());
    return state.hasError == false;
  }
}
