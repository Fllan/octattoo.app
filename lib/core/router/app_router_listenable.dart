import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/services/firebase/authentication/auth_providers.dart';
import 'package:octattoo_app/core/utils/logger.dart';

class AppRouterListenable extends ChangeNotifier {
  AppRouterListenable({required this.ref});
  final Ref ref;

  Future<void> signOut() => ref
      .watch(authServiceProvider)
      .signOut()
      .then((value) {
        logger.d("Notifying listeners after sign out");
        notifyListeners();
      });
  
  Future<void> signInAnonymously() => ref
      .watch(anonymousAuthProvider)
      .signInAnonymously()
      .then((value) {
        logger.d("Notifying listeners after sign in anonymously");
        notifyListeners();
      });
}

final appRouterListenableProvider =
    Provider<AppRouterListenable>((ref) => AppRouterListenable(ref: ref));