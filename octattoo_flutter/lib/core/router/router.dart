import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_flutter/core/providers/serverpod_helper.dart';
import 'package:octattoo_flutter/core/router/app_startup.dart';
import 'package:octattoo_flutter/core/router/destinations/primary_destinations.dart';
import 'package:octattoo_flutter/core/router/routes/app_routes.dart';
import 'package:octattoo_flutter/core/router/routes/guest_routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  final appStartupState = ref.watch(appStartupProvider);
  final sessionManager = ref.watch(serverpodHelperProvider).sessionManager;

  final rootNavigatorKey = GlobalKey<NavigatorState>();
  final shellNavigatorSignInKey =
      GlobalKey<NavigatorState>(debugLabel: 'ShellNavigatorSignIn');
  final shellNavigatorRegisterKey =
      GlobalKey<NavigatorState>(debugLabel: 'ShellNavigatorRegister');
  final shellNavigatorAppointmentsKey =
      GlobalKey<NavigatorState>(debugLabel: 'ShellNavigatorAppointments');
  final shellNavigatorCustomersKey =
      GlobalKey<NavigatorState>(debugLabel: 'ShellNavigatorCustomers');

  return GoRouter(
    initialLocation: '/startup',
    navigatorKey: rootNavigatorKey,
    refreshListenable: sessionManager,
    debugLogDiagnostics: false,
    redirect: (context, state) {
      if (appStartupState.isLoading || appStartupState.hasError) {
        print("appStartupState.isLoading || appStartupState.hasError");
        return '/startup';
      }

      print("appStartup completed");

      final isLoggedIn = sessionManager.isSignedIn;

      final isSigningIn =
          state.uri.pathSegments.first == GuestRoutes.signIn.name;
      final isRegistering =
          state.uri.pathSegments.first == GuestRoutes.register.name;
      final isForgotPassword =
          state.uri.pathSegments.first == GuestRoutes.forgotPassword.name;
      final isGuest = isSigningIn || isRegistering || isForgotPassword;

      if (!isLoggedIn) {
        if (!isGuest) {
          return GuestRoutes.signIn.path;
        } else {
          return null;
        }
      } else {
        return AppRoutes.appointments.path;
      }
    },
    routes: [
      GoRoute(
        path: '/startup',
        pageBuilder: (context, state) => NoTransitionPage(
          child: AppStartupWidget(
            // * This is just a placeholder
            // * The loaded route will be managed by GoRouter on state change
            onLoaded: (_) => const SizedBox.shrink(),
          ),
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          List<PrimaryDestination> guestDestinations =
              createGuestDestinations(context);
          // return AdaptiveScaffold(
          //   navigationShell: navigationShell,
          //   destinations: welcomeDestinations,
          // );
          return Scaffold(body: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: shellNavigatorSignInKey,
            routes: [
              GoRoute(
                path: GuestRoutes.signIn.path,
                name: GuestRoutes.signIn.name,
                builder: (context, state) => GuestRoutes.signIn.screen,
                routes: [
                  GoRoute(
                    path: GuestRoutes.forgotPassword.path,
                    name: GuestRoutes.forgotPassword.name,
                    pageBuilder: (context, state) => NoTransitionPage(
                        child: GuestRoutes.forgotPassword.screen),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: shellNavigatorRegisterKey,
            routes: [
              GoRoute(
                path: GuestRoutes.register.path,
                name: GuestRoutes.register.name,
                builder: (context, state) => GuestRoutes.register.screen,
              ),
            ],
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          List<PrimaryDestination> appDestinations =
              createAppDestinations(context);
          // return AdaptiveScaffold(
          //   navigationShell: navigationShell,
          //   destinations: appDestinations,
          // );
          return Scaffold(body: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: shellNavigatorAppointmentsKey,
            routes: [
              GoRoute(
                path: AppRoutes.appointments.path,
                name: AppRoutes.appointments.name,
                builder: (context, state) => AppRoutes.appointments.screen,
                routes: [
                  GoRoute(
                    path: AppRoutes.appointmentDetails.path,
                    name: AppRoutes.appointmentDetails.name,
                    builder: (context, state) =>
                        AppRoutes.appointmentDetails.screen,
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: shellNavigatorCustomersKey,
            routes: [
              GoRoute(
                path: AppRoutes.customers.path,
                name: AppRoutes.customers.name,
                builder: (context, state) => AppRoutes.customers.screen,
                routes: [
                  GoRoute(
                    path: AppRoutes.customerDetails.path,
                    name: AppRoutes.customerDetails.name,
                    builder: (context, state) =>
                        AppRoutes.customerDetails.screen,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
