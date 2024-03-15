import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/src/features/authentication/data/auth_repository.dart';

class AppRouterListenable extends ChangeNotifier {
  AppRouterListenable({required this.ref});
  final Ref ref;

  Future<void> signOut() => ref
      .read(authRepositoryProvider)
      .signOut()
      .then((value) => notifyListeners());
}

final appRouterListenableProvider =
    Provider<AppRouterListenable>((ref) => AppRouterListenable(ref: ref));