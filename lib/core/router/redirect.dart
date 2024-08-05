import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app_mvp/core/models/user.dart';
import 'package:octattoo_app_mvp/core/services/firebase/authentication/authentication_repository.dart';
import 'package:octattoo_app_mvp/core/services/firebase/firestore/providers/users_repository.dart';
import 'package:octattoo_app_mvp/core/start/app_startup_provider.dart';
import 'package:octattoo_app_mvp/core/utils/logger/logger.dart';
import 'package:octattoo_app_mvp/core/utils/shared_preferences/shared_preferences_keys.dart';
import 'package:octattoo_app_mvp/core/utils/shared_preferences/shared_preferences_repository.dart';

Future<String?> redirect(
    BuildContext context, GoRouterState state, Ref ref) async {
  final isWelcoming = state.uri.pathSegments.first == 'welcome';
  final isOnboarding = state.uri.pathSegments.first == 'onboarding';

  // Get the app startup state
  final appStartupState = ref.watch(appStartupProvider);

  // If the app is still loading or has an error, redirect to the startup page
  if (appStartupState.isLoading || appStartupState.hasError) {
    logger.d('App is still loading or has an error');
    return '/startup';
  }

  // Get the authentication state
  final currentAuthUser = ref.read(authRepositoryProvider).currentUser;
  bool isLoggedIn = currentAuthUser != null;
  bool isAnonymous = currentAuthUser?.isAnonymous ?? false;
  String? authUserId = currentAuthUser?.uid;

  // Redirect unauthenticated users to the welcome page
  if (!isLoggedIn) {
    if (!isWelcoming) {
      logger.d('Redirecting unauthenticated user to /welcome');
      return '/welcome';
    }
    return null;
  }

  logger.d(
      'User is authenticated with uid: $authUserId isAnonymous: $isAnonymous');

  // Redirect authenticated users who have not completed onboarding to the onboarding page
  if (!isOnboarding) {
    logger.d('Checking if uid: $authUserId has an account in Firestore...');
    User? user = await ref.read(usersRepositoryProvider).read(authUserId!);

    if (user == null) {
      logger.d(
          'uid: $authUserId does not have an account. Redirecting to /onboarding');
      return '/onboarding';
    }

    final String debugUser = user.toJson().toString();
    logger.d('uid: $authUserId has an account in Firestore: $debugUser');
    bool hasCompletedOnboarding = user.hasCompletedOnboarding;

    // Handle onboarding redirection logic
    if (!hasCompletedOnboarding) {
      final prefs = ref.read(sharedPreferencesRepositoryProvider);
      const artistNameKey = SharedPreferencesKeys.onboardingArtistName;
      final String? artistName = prefs.getString(artistNameKey);
      bool hasArtistName = artistName != null && artistName.isNotEmpty;
      const workplaceTypeKey = SharedPreferencesKeys.onboardingWorkplaceType;
      final String? workplaceType = prefs.getString(workplaceTypeKey);
      bool hasWorkplaceTypeSelected =
          workplaceType != null && workplaceType.isNotEmpty;

      if (!hasArtistName) {
        logger.d(
            'user: $authUserId has no artist name set. Redirecting to /onboarding/artist-profile');
        return '/onboarding/artist-profile';
      }
      if (!hasWorkplaceTypeSelected) {
        logger.d(
            'user: $authUserId has no workplace type selected. Redirecting to /onboarding/workplace');
        return '/onboarding/workplace';
      }
      return null;
    }
    // Redirect authenticated users who have completed onboarding to the dashboard
    logger.d(
        'user: $authUserId has completed onboarding. Redirecting to /dashboard');
    return '/dashboard';
  }
  return null;
}
