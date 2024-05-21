import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/core/router/models/route_path.dart';
import 'package:octattoo_app/core/services/firebase/authentication/auth_providers.dart';
import 'package:octattoo_app/core/services/firebase/firestore/firestore_providers.dart';
import 'package:octattoo_app/core/utils/logger.dart';

/// Redirects the route based on the user's authentication and onboarding status.
FutureOr<String?> appRouteRedirect(
    BuildContext context, Ref ref, GoRouterState state) async {
  final user = ref.read(authServiceProvider).currentUser;
  final isloggedIn = user != null;
  final isLoggingOut = user == null && state.matchedLocation == '/onboarding';
  
  logger.d("Redirect Check: isLoggedIn: $isloggedIn, Location: ${state.uri.toString()}");

  if (isLoggingOut) {
    logger.d("User is logging out. Redirecting to root.");
    return '/';
  }

  if (!isloggedIn &&
      !isLoggingOut &&
      (state.matchedLocation == RoutePath.signin.path ||
       state.matchedLocation == RoutePath.root.path)) {
    logger.d("User is not logged in and not on sign in or root route. No redirection.");
    return null;
  }
  
  bool hasCompletedOnboarding = false;
  if (isloggedIn) {
    final userRepository = ref.read(userRepositoryProvider);
    final existingUser = await userRepository.getUser(user.uid);
    hasCompletedOnboarding =
        existingUser?.hasCompletedOnboarding ?? false;
    logger.d("User is logged in. hasCompletedOnboarding: $hasCompletedOnboarding");
  }

  if (isloggedIn && hasCompletedOnboarding) {
    logger.d("User is logged in and has completed onboarding. Redirecting to artist profile.");
    return '/artistProfile';
  } else if (isloggedIn && !hasCompletedOnboarding) {
    logger.d("User is logged in but has not completed onboarding. Redirecting to onboarding.");
    return '/onboarding';
  }

  logger.d("No redirection.");
  return null;
}