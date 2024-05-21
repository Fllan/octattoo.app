import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/services/firebase/authentication/auth_providers.dart';
import 'package:octattoo_app/core/utils/logger.dart';

/// A ChangeNotifier that notifies listeners when the user signs in or out.
class AppRouterListenable extends ChangeNotifier {
  /// Creates an AppRouterListenable.
  ///
  /// The [ref] parameter is required and is used to access the ProviderContainer.
  AppRouterListenable({required this.ref});
  final Ref ref;

  /// Signs the user out and notifies listeners.
  Future<void> signOut() => ref
      .watch(authServiceProvider)
      .signOut()
      .then((value) {
        logger.d("Notifying listeners after sign out");
        notifyListeners();
      });
  
  /// Signs the user in anonymously and notifies listeners.
  Future<void> signInAnonymously() => ref
      .watch(anonymousAuthProvider)
      .signInAnonymously()
      .then((value) {
        logger.d("Notifying listeners after sign in anonymously");
        notifyListeners();
      });
}

/// A Provider for the AppRouterListenable.
final appRouterListenableProvider =
    Provider<AppRouterListenable>((ref) => AppRouterListenable(ref: ref));