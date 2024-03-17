import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/src/features/authentication/data/auth_repository.dart';
import 'package:octattoo_app/src/features/router/app_router.dart';

FutureOr<String?> appRouteRedirect(BuildContext context, Ref ref, GoRouterState state) async {
  final user = ref.read(authRepositoryProvider).currentUser;
  final isloggedIn = user != null;
  final isLoggingOut = user == null && state.matchedLocation == '/onboarding';

  if (isLoggingOut) return '/';

  if (!isloggedIn && !isLoggingOut && (
    state.matchedLocation == RoutePath.signin.path ||
    state.matchedLocation == RoutePath.root.path)) {
      return null;
    }

  const hasCompletedOnboarding = false; // TODO: implement logic to check if Onboarding is done on Firestore

  if (isloggedIn  && hasCompletedOnboarding) {
    return '/artistProfile';
  }
  else if (isloggedIn && !hasCompletedOnboarding) {
    return '/onboarding';
  }

  return null;
}