import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app_mvp/core/models/user.dart';
import 'package:octattoo_app_mvp/core/services/firebase/authentication/authentication_repository.dart';
import 'package:octattoo_app_mvp/core/services/firebase/firestore/providers/users_repository.dart';
import 'package:octattoo_app_mvp/core/start/app_startup_provider.dart';
import 'package:octattoo_app_mvp/core/utils/logger/logger.dart';

Future<String?> redirect(
    BuildContext context, GoRouterState state, Ref ref) async {
  final isWelcoming = state.uri.pathSegments.first == 'welcome';
  final isOnboarding = state.uri.pathSegments.first == 'onboarding';

  // Get the app startup state
  final appStartupState = ref.watch(appStartupProvider);

  // If the app is still loading or has an error, redirect to the startup page
  if (appStartupState.isLoading || appStartupState.hasError) {
    logger.d('App is still loading or has an error.');
    return '/startup';
  }

  // Get the authentication state
  final currentAuthUser = ref.watch(authRepositoryProvider).currentUser;
  bool isLoggedIn = false;
  String? authUserId;

  if (currentAuthUser != null) {
    authUserId = currentAuthUser.uid;
    isLoggedIn = true;
  }

  // Get the user's account status
  if (!isLoggedIn && !isWelcoming) {
    logger.d('Redirecting unauthenticated user to /welcome');
    return '/welcome';
  } else if (!isLoggedIn && isWelcoming) {
    return null;
  } else {
    logger.d('User is authenticated');
    logger.d('Checking if authenticated user has an account...');
    User? user = await ref.watch(usersRepositoryProvider).read(authUserId!);

    if (user == null) {
      logger.d(
          'Authenticated user does not have an account and is redirecting to /onboarding');
      return '/onboarding';
    } else {
      logger.d('Authenticated user has an account: $user');
      bool hasCompletedOnboarding = user.hasCompletedOnboarding;

      if (!hasCompletedOnboarding && isOnboarding) {
        return null;
      } else if (!hasCompletedOnboarding && !isOnboarding) {
        logger.d(
            'User has not completed onboarding and is redirecting to /onboarding');
        return '/onboarding';
      } else {
        logger.d(
            'User has completed onboarding and is redirecting to /dashboard');
        return '/dashboard';
      }
    }
  }
}
