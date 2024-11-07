import 'package:octattoo_app/src/authentication/application/app_user_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'anonymous_register_controller.g.dart';

@riverpod
class AnonymousRegisterController extends _$AnonymousRegisterController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  Future<bool> registerAnonymously() async {
    final appUserService = ref.watch(appUserServiceProvider);
    state = const AsyncValue.loading();
    await AsyncValue.guard(() => appUserService.signInAnonymously());
    return state.hasError == false;
  }
}
