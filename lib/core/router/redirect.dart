import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app_mvp/core/services/firebase/authentication/authentication_repository.dart';
import 'package:octattoo_app_mvp/core/start/app_startup_provider.dart';
import 'package:octattoo_app_mvp/core/utils/shared_preferences_repository.dart';

FutureOr<String?> redirect(BuildContext context, GoRouterState state, Ref ref) {
  // Get the app startup state
  final appStartupState = ref.watch(appStartupProvider);
  // Get the authentication state
  final isLoggedIn = ref.watch(authRepositoryProvider).currentUser != null;
  final isWelcoming = state.uri.pathSegments.first == 'welcome';
  final isOnboarding = state.uri.pathSegments.first == 'onboarding';
  late final currentOnboardingStep =
      ref.read(sharedPreferencesRepositoryProvider).getCurrentOnboardingStep();

  // If the app is still loading or has an error, redirect to the startup page
  if (appStartupState.isLoading || appStartupState.hasError) {
    return '/startup';
  }

  if (isLoggedIn && isWelcoming) {
    if (currentOnboardingStep != null && currentOnboardingStep == 1) {
      return '/onboarding/artist-profile';
    }
    return '/onboarding';
  } else if (!isLoggedIn && isOnboarding) {
    return '/welcome';
  }
  return null;
}
