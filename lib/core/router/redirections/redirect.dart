import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app_mvp/core/services/firebase/authentication/authentication_repository.dart';
import 'package:octattoo_app_mvp/core/utils/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

FutureOr<String?> redirect(BuildContext context, GoRouterState state, Ref widgetRef) async {
  logger.d('Redirecting to ${state.uri}');
  final isAuthenticated = widgetRef.watch(authStateChangesProvider).value != null;
  logger.d('isAuthenticated = $isAuthenticated');
  
  final isOnboarding = state.uri.pathSegments.first == 'onboarding';
  final isWelcoming = state.uri.pathSegments.first == 'welcome';

  
  if (isAuthenticated && isWelcoming) {
    return '/onboarding';
  } else if (!isAuthenticated && isOnboarding) {
    return '/welcome';
  }
  return null;
}