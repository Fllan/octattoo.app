import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/services/firebase/authentication/auth_providers.dart';

class AppRouterListenable extends ChangeNotifier {
  AppRouterListenable({required this.ref});
  final Ref ref;

  Future<void> signOut() => ref
      .read(authServiceProvider)
      .signOut()
      .then((value) => notifyListeners());
  
  Future<void> signInAnonymously() => ref
      .read(anonymousAuthProvider)
      .signInAnonymously()
      .then((value) => notifyListeners());
}

final appRouterListenableProvider =
    Provider<AppRouterListenable>((ref) => AppRouterListenable(ref: ref));