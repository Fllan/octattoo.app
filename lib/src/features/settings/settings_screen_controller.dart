import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/src/features/router/app_router_listenable.dart';

class SettingsScreenController extends StateNotifier<AsyncValue<void>> {
  SettingsScreenController({required this.listenable})
      : super(const AsyncData(null));
  final AppRouterListenable listenable;

  Future<void> logout() async {
    state = const AsyncLoading();
    final newState = await AsyncValue.guard(listenable.signOut);
    if (mounted) {
      state = newState;
    }
  }
}

final settingsScreenControllerProvider =
    StateNotifierProvider<SettingsScreenController, AsyncValue<void>>((ref) =>
        SettingsScreenController(
            listenable: ref.watch(appRouterListenableProvider)));