import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/features/authentication/data/auth_repository.dart';

FutureOr<String?> appRouteRedirect(
    BuildContext context, Ref ref, GoRouterState state) async {
  final user = ref.read(authRepositoryProvider).currentUser;
  final loggedIn = user != null;
  final loggingOut = user == null && state.matchedLocation == '/settings';
  final loggingIn = state.matchedLocation == '/signin';

  if (loggingOut) return '/';

  if (loggedIn && loggingIn && user.displayName != null) {
    return '/home';
  }

  if (loggedIn && loggingIn && user.displayName == null) return '/onboarding';

  return null;
}
