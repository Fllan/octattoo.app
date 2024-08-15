import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/core/router/app_startup.dart';
import 'package:octattoo_app/core/utils/logger.dart';
import 'package:octattoo_app/src/customers/presentation/customer_details.dart';
import 'package:octattoo_app/src/customers/presentation/customers_list_widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAppointmentsKey =
    GlobalKey<NavigatorState>(debugLabel: 'ShellNavigatorAppointments');
final _shellNavigatorCustomersKey =
    GlobalKey<NavigatorState>(debugLabel: 'ShellNavigatorCustomers');

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final appStartupState = ref.watch(appStartupProvider);
  // final authRepository = ref.watch(authRepositoryProvider);

  return GoRouter(
    initialLocation: '/startup',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: false,
    redirect: (context, state) {
      if (appStartupState.isLoading || appStartupState.hasError) {
        logger.d('App is still loading or has an error...');
        return '/startup';
      }
      logger.d('App startup is complete');
      //final isLoggedIn = authRepository.currentUser != null;
      // ! Test only
      const isLoggedIn = true;
      const isOnboarded = true;
      // ! Test only
      final isSigningIn = state.uri.pathSegments.first == 'signIn';
      final isRegistering = state.uri.pathSegments.first == 'register';
      final isForgotPassword =
          state.uri.pathSegments.first == 'forgot-password';
      final isWelcoming = isSigningIn || isRegistering || isForgotPassword;

      final isOnboardingArtistName =
          state.uri.pathSegments.first == 'artist-name';
      final isOnboardingWorkplace = state.uri.pathSegments.first == 'workplace';
      final isOnboarding = isOnboardingArtistName || isOnboardingWorkplace;

      final isAppointments = state.uri.pathSegments.first == 'appointments';
      final isCustomers = state.uri.pathSegments.first == 'customers';
      final isAppShell = isAppointments || isCustomers;

      if (!isLoggedIn) {
        if (!isWelcoming) {
          logger.d('User is not logged in. Redirect to /signIn');
          return '/signIn';
        }
      } else {
        logger.d('GoRouter redirect : User is logged in');
        if (!isOnboarded) {
          if (!isOnboarding) {
            logger.d('User is not onboarded. Redirect to /artist-name');
            return '/artist-name';
          }
        } else {
          if (!isAppShell) {
            logger.d('User is logged in. Redirect to /home');
            return '/appointments';
          }
          return null;
        }
        return null;
      }
      return null;
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
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorAppointmentsKey,
            routes: [
              GoRoute(
                path: '/appointments',
                name: 'appointments',
                // ! Test only - not yet implemented
                builder: (context, state) {
                  return const Placeholder();
                },
                // ! or.... ?
                pageBuilder: (context, state) {
                  return const MaterialPage(child: Placeholder());
                },
                routes: [
                  GoRoute(
                    path: 'details/:idAppointment',
                    name: 'appointmentDetails',
                    // ! Test only - not yet implemented
                    builder: (context, state) {
                      return const Placeholder();
                    },
                    // ! or.... ?
                    pageBuilder: (context, state) {
                      return const MaterialPage(child: Placeholder());
                    },
                    // ! Test only - not yet implemented
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorCustomersKey,
            routes: [
              GoRoute(
                path: '/customers',
                name: 'customers',
                pageBuilder: (context, state) {
                  logger.d('Navigating to CustomersListWidget');
                  return MaterialPage(
                    key: state.pageKey,
                    restorationId: state.pageKey.toString(),
                    child: CustomersListWidget(),
                  );
                },
                routes: [
                  GoRoute(
                    path: 'details/:idCustomer',
                    name: 'customerDetails',
                    pageBuilder: (context, state) {
                      logger.d(
                          'Navigating to CustomerDetails: ${state.pathParameters['idCustomer']}');
                      return MaterialPage(
                        key: state.pageKey,
                        restorationId: state.pageKey.toString(),
                        child: CustomerDetails(
                          idCustomer: state.pathParameters['idCustomer'],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
        // ! Test only - not yet implemented
        builder: (context, state, navigationShell) {
          return const Placeholder();
        },
        // ! or.... ?
        pageBuilder: (context, state, navigationShell) {
          return const MaterialPage(child: Placeholder());
        },
      ),
    ],
  );
}
