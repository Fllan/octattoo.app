import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/src/features/artist_profile/artist_profile_screen.dart';
import 'package:octattoo_app/src/features/authentication/presentation/signin_screen.dart';
import 'package:octattoo_app/src/features/onboarding/onboarding_screen.dart';
import 'package:octattoo_app/src/features/router/app_router_listenable.dart';
import 'package:octattoo_app/src/features/router/app_router_redirection.dart';
import 'package:octattoo_app/src/features/welcome/welcome_screen.dart';

enum RoutePath {
  root(path: '/'),
  welcome(path: 'welcome'),
  signin(path: 'signin'),
  onboarding(path: 'onboarding'),
  settings(path: 'settings'),
  artistProfile(path: 'artistProfile');

  const RoutePath({required this.path});
  final String path;
}

final goRouterProvider = Provider<GoRouter>((ref) {
  final rootNaveKey = GlobalKey<NavigatorState>(debugLabel: 'rootNav');
  // final homeNaveKey = GlobalKey<NavigatorState>(debugLabel: 'homeNav');
  // final chatsNaveKey = GlobalKey<NavigatorState>(debugLabel: 'chatsNav');
  // final accountNaveKey = GlobalKey<NavigatorState>(debugLabel: 'accountNav');

  final listenable = ref.watch(appRouterListenableProvider);
  return GoRouter(
      navigatorKey: rootNaveKey,
      refreshListenable: listenable,
      redirect: (context, state) => appRouteRedirect(context, ref, state),
      routes: [
        GoRoute(
            path: RoutePath.root.path,
            name: RoutePath.root.name,
            builder: (context, state) => const WelcomeScreen(),
            routes: [
              GoRoute(
                  path: RoutePath.signin.path,
                  name: RoutePath.signin.name,
                  pageBuilder: (context, state) =>
                      const MaterialPage(child: SigninScreen())),
              GoRoute(
                  path: RoutePath.onboarding.path,
                  name: RoutePath.onboarding.name,
                  pageBuilder: (context, state) =>
                      const MaterialPage(child: OnboardingScreen())),
              GoRoute(
                  path: RoutePath.artistProfile.path,
                  name: RoutePath.artistProfile.name,
                  pageBuilder: (context, state) =>
                      const MaterialPage(child: ArtistProfileScreen())),
            ])
      ]);
});
