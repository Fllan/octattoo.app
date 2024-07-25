import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app_mvp/core/services/firebase/authentication/authentication_repository.dart';
import 'package:octattoo_app_mvp/core/start/app_startup_provider.dart';
import 'package:octattoo_app_mvp/core/utils/shared_preferences/shared_preferences_repository.dart';

/// Determines the redirect path based on the application's state and user's authentication status.
///
/// This function is used by the GoRouter to redirect users to appropriate routes during navigation.
/// It considers the app startup state, user's authentication status, and onboarding progress.
///
/// - **App Startup State**: Redirects to the startup page if the app is still loading or has encountered an error.
/// - **Authentication State**:
///   - Redirects authenticated users away from the welcome page.
///   - Redirects unauthenticated users away from the onboarding page.
/// - **Onboarding State**: Directs users to their current onboarding step if they are logged in and have an ongoing onboarding process.
///
/// Returns `null` if no redirection is necessary.
FutureOr<String?> redirect(BuildContext context, GoRouterState state, Ref ref) {
  // Get the app startup state
  final appStartupState = ref.watch(appStartupProvider);

  // Get the authentication state
  final isLoggedIn = ref.watch(authRepositoryProvider).currentUser != null;
  final isWelcoming = state.uri.pathSegments.first == 'welcome';
  final isOnboarding = state.uri.pathSegments.first == 'onboarding';

  // Retrieve the current onboarding step from shared preferences
  late final currentOnboardingStep =
      ref.read(sharedPreferencesRepositoryProvider).getCurrentOnboardingStep();

  // If the app is still loading or has an error, redirect to the startup page
  if (appStartupState.isLoading || appStartupState.hasError) {
    return '/startup';
  }

  // Redirect authenticated users away from the welcome page to onboarding steps if necessary
  if (isLoggedIn && isWelcoming) {
    if (currentOnboardingStep != null && currentOnboardingStep == 1) {
      return '/onboarding/artist-profile';
    }
    return '/onboarding';
  }
  // Redirect unauthenticated users away from the onboarding page to the welcome page
  else if (!isLoggedIn && isOnboarding) {
    return '/welcome';
  }

  // No redirection needed
  return null;
}
