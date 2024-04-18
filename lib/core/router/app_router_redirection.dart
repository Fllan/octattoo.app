import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/core/router/models/route_path.dart';
import 'package:octattoo_app/core/services/firebase/authentication/auth_providers.dart';
import 'package:octattoo_app/core/services/firebase/firestore/firestore_providers.dart';
import 'package:octattoo_app/core/utils/logger.dart';

FutureOr<String?> appRouteRedirect(
    BuildContext context, Ref ref, GoRouterState state) async {
  final user = ref.read(authServiceProvider).currentUser;
  final isloggedIn = user != null;
  final isLoggingOut = user == null && state.matchedLocation == '/onboarding';
  
  logger.d("Redirect Check: isLoggedIn: $isloggedIn, Location: ${state.uri.toString()}");

  if (isLoggingOut) return '/';

  if (!isloggedIn &&
      !isLoggingOut &&
      (state.matchedLocation == RoutePath.signin.path ||
       state.matchedLocation == RoutePath.root.path)) {
    return null;
  }
  
bool hasCompletedOnboarding = false;
  if (isloggedIn) {
    final userRepository = ref.read(userRepositoryProvider);
    final existingUser = await userRepository.getUser(user.uid);
    hasCompletedOnboarding =
        existingUser?.hasCompletedOnboarding ?? false;
  }

  if (isloggedIn && hasCompletedOnboarding) {
    return '/artistProfile';
  } else if (isloggedIn && !hasCompletedOnboarding) {
    return '/onboarding';
  }

  return null;
}