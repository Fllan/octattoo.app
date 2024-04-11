import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/src/features/sign_in/application/signin_service.dart';
import 'package:octattoo_app/core/router/app_router_listenable.dart';

class SigninScreenController extends StateNotifier<AsyncValue<void>> {
  SigninScreenController({required this.service, required this.listenable})
      : super(const AsyncData(null));
  final SigninService service;
  final AppRouterListenable listenable;


}

final signinScreenControllerProvider =
    StateNotifierProvider.autoDispose<SigninScreenController, AsyncValue<void>>(
        (ref) => SigninScreenController(
            service: ref.watch(signinServiceProvider),
            listenable: ref.watch(appRouterListenableProvider)));