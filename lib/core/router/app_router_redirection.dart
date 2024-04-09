import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/core/services/firebase/authentication/auth_providers.dart';
import 'package:octattoo_app/core/router/app_router.dart';

FutureOr<String?> appRouteRedirect(
    BuildContext context, Ref ref, GoRouterState state) async {
  final user = ref.read(authServiceProvider).currentUser;
  final isloggedIn = user != null;
  final isLoggingOut = user == null && state.matchedLocation == '/onboarding';

  if (isLoggingOut) return '/';

  if (!isloggedIn &&
      !isLoggingOut &&
      (state.matchedLocation == RoutePath.signin.path ||
       state.matchedLocation == RoutePath.root.path)) {
    return null;
  }
  
  bool hasCompletedOnboarding = false;
  if (isloggedIn) {
    final docSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    hasCompletedOnboarding =
        docSnapshot.data()?['hasCompletedOnboarding'] ?? false;
  }

  if (isloggedIn && hasCompletedOnboarding) {
    return '/artistProfile';
  } else if (isloggedIn && !hasCompletedOnboarding) {
    return '/onboarding';
  }

  return null;
}
