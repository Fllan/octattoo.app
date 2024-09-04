// lib/core/router/router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/core/constants/primary_destinations.dart';
import 'package:octattoo_app/core/constants/window_size_class.dart';
import 'package:octattoo_app/core/layouts/adaptive_scaffold/compact_scaffold.dart';
import 'package:octattoo_app/core/layouts/adaptive_scaffold/expanded_scaffold.dart';
import 'package:octattoo_app/core/layouts/adaptive_scaffold/extra_large_scaffold.dart';
import 'package:octattoo_app/core/layouts/adaptive_scaffold/large_scaffold.dart';
import 'package:octattoo_app/core/layouts/adaptive_scaffold/medium_scaffold.dart';
import 'package:octattoo_app/core/layouts/responsive_layout.dart';
import 'package:octattoo_app/core/router/app_startup.dart';
import 'package:octattoo_app/core/utils/logger.dart';
import 'package:octattoo_app/src/appointments/presentation/appointment_details_screen.dart';
import 'package:octattoo_app/src/appointments/presentation/appointments_details.dart';
import 'package:octattoo_app/src/appointments/presentation/appointments_list.dart';
import 'package:octattoo_app/src/appointments/presentation/appointments_list_screen.dart';
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
  logger.d('GoRouter: build');
  final appStartupState = ref.watch(appStartupProvider);

  return GoRouter(
    initialLocation: '/startup',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      if (appStartupState.isLoading || appStartupState.hasError) {
        logger.d('Router: redirect to /startup');
        return '/startup';
      }

      const isLoggedIn = true;
      const isOnboarded = true;

      if (!isLoggedIn) {
        return '/signIn';
      } else if (!isOnboarded) {
        return '/artist-name';
      } else if (!state.uri.pathSegments.contains('appointments') &&
          !state.uri.pathSegments.contains('customers')) {
        logger.d('Router: redirect to /appointments');
        return '/appointments';
      }
      logger.d('Router: redirect to null (${state.uri})');
      return null;
    },
    routes: [
      GoRoute(
        path: '/startup',
        pageBuilder: (context, state) => NoTransitionPage(
          child: AppStartupWidget(
            onLoaded: (_) => const SizedBox.shrink(),
          ),
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, goRouterstate, statefulNavigationShell) {
          logger.d(
              'Router: StatefulShellRoute.indexedStack Builder: [state.uri] ${goRouterstate.uri} - [navigationShell.currentIndex] ${statefulNavigationShell.currentIndex}');
          final destinations = createAppDestinations(context);

          // return LayoutBuilder(builder: (context, constraints) {
          //   final currentWidth = constraints.maxWidth;
          //   final currentHeight = constraints.maxHeight;

          //   logger.d(
          //       'Router: currentWidth: $currentWidth - currentHeight: $currentHeight');

          //   final currentWindowSizeClass = getWindowSizeClass(currentWidth);
          //   final isHeightCompact =
          //       currentHeight < WindowSizeClass.minHeightCompact;

          //   logger.d(
          //       'Router: currentWindowSizeClass: $currentWindowSizeClass - isHeightCompact: $isHeightCompact');

          //   if (currentWindowSizeClass == WindowSizeClass.compact) {
          //     logger.d('Router: return CompactScaffold');
          //     return CompactScaffold(
          //       navigationShell: statefulNavigationShell,
          //       destinations: destinations,
          //       goRouterState: goRouterstate,
          //       isHeightCompact: isHeightCompact,
          //     );
          //   } else if (currentWindowSizeClass == WindowSizeClass.medium) {
          //     logger.d('Router: return MediumScaffold');
          //     return MediumScaffold(
          //       navigationShell: statefulNavigationShell,
          //       destinations: destinations,
          //       goRouterState: goRouterstate,
          //       isHeightCompact: isHeightCompact,
          //     );
          //   } else if (currentWindowSizeClass == WindowSizeClass.expanded) {
          //     return ExpandedScaffold(
          //       navigationShell: statefulNavigationShell,
          //       destinations: destinations,
          //       goRouterState: goRouterstate,
          //       isHeightCompact: isHeightCompact,
          //     );
          //   } else if (currentWindowSizeClass == WindowSizeClass.large) {
          //     return LargeScaffold(
          //       navigationShell: statefulNavigationShell,
          //       destinations: destinations,
          //       goRouterState: goRouterstate,
          //       isHeightCompact: isHeightCompact,
          //     );
          //   } else {
          //     return ExtraLargeScaffold(
          //       navigationShell: statefulNavigationShell,
          //       destinations: destinations,
          //       goRouterState: goRouterstate,
          //       isHeightCompact: isHeightCompact,
          //     );
          //   }
          // });

          return ResponsiveLayout(
            navigationShell: statefulNavigationShell,
            destinations: destinations,
            goRouterState: goRouterstate,
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorAppointmentsKey,
            routes: [
              GoRoute(
                path: '/appointments',
                name: 'appointments',
                builder: (context, state) {
                  // return const AppointmentsListWidget();
                  return const AppointmentsListScreen();
                },
                routes: [
                  GoRoute(
                    path: ':idAppointment',
                    name: 'appointmentDetails',
                    // pageBuilder: (context, state) {
                    //   return MaterialPage(
                    //     key: state.pageKey,
                    //     child: AppointmentDetails(
                    //       idAppointment: state.pathParameters['idAppointment'],
                    //     ),
                    //     fullscreenDialog: true,
                    //   );
                    // },
                    builder: (context, state) {
                      return AppointmentsDetailsScreen(
                          appointmentId: state.pathParameters['idAppointment']);
                    },
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
                builder: (context, state) {
                  return const CustomersListWidget();
                },
                routes: [
                  GoRoute(
                    path: ':idCustomer',
                    name: 'customerDetails',
                    builder: (context, state) {
                      return CustomerDetails(
                        idCustomer: state.pathParameters['idCustomer'],
                      );
                    },
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
