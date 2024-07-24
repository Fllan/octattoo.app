import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app_mvp/core/constants/worplace_types.dart';
import 'package:octattoo_app_mvp/core/router/redirections/redirect.dart';
import 'package:octattoo_app_mvp/core/router/routes.dart';
import 'package:octattoo_app_mvp/core/router/shells/onboarding_shell.dart';
import 'package:octattoo_app_mvp/core/router/shells/welcome_shell.dart';
import 'package:octattoo_app_mvp/src/onboarding/add_workplace.dart';
import 'package:octattoo_app_mvp/src/onboarding/artist_profile_screen.dart';
import 'package:octattoo_app_mvp/src/onboarding/onboarding_screen.dart';
import 'package:octattoo_app_mvp/src/onboarding/workplace_availabilities.dart';
import 'package:octattoo_app_mvp/src/onboarding/workplace_details.dart';
import 'package:octattoo_app_mvp/src/onboarding/workplaces_type.dart';
import 'package:octattoo_app_mvp/src/register/register_screen.dart';
import 'package:octattoo_app_mvp/src/signin/forgot_password_screen.dart';
import 'package:octattoo_app_mvp/src/signin/signin_screen.dart';
import 'package:octattoo_app_mvp/src/welcome/welcome_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// import 'scaffold_with_navigation.dart';

part 'router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _welcomeNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: TopLevelDestinations.welcome.name);
final _onboardingNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: TopLevelDestinations.onboarding.name);
// final _dashboardNavigatorKey = GlobalKey<NavigatorState>(debugLabel: TopLevelDestinations.dashboard.name);
// final _appointmentsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: DashboardSubRoutes.appointments.name);
// final _customersNavigatorKey = GlobalKey<NavigatorState>(debugLabel: DashboardSubRoutes.customers.name);
// final _projectsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: DashboardSubRoutes.projects.name);
// final _artistProfileNavigatorKey = GlobalKey<NavigatorState>(debugLabel: DashboardSubRoutes.artistProfile.name);

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: '/welcome',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      return redirect(context, state, ref);
    },
    routes: [
      ShellRoute(
        navigatorKey: _welcomeNavigatorKey,
        builder: (context, state, child) {
          return WelcomeShell(child: child);
        },
        routes: [
          GoRoute(
            path: '/welcome',
            name: TopLevelDestinations.welcome.name,
            pageBuilder: (context, state) {
              return const MaterialPage(child: WelcomeScreen());
            },
            routes: [
              GoRoute(
                path: 'signin',
                name: WelcomeSubRoutes.signin.name,
                pageBuilder: (context, state) {
                  return MaterialPage(child: SignInScreen());
                },
                routes: [
                  GoRoute(
                    path: 'forgot-password',
                    name: SignInSubRoutes.forgotPassword.name,
                    pageBuilder: (context, state) {
                      return MaterialPage(child: ForgotPasswordScreen());
                    },
                  ),
                ],
              ),
              GoRoute(
                path: 'register',
                name: WelcomeSubRoutes.register.name,
                pageBuilder: (context, state) {
                  return MaterialPage(child: RegisterScreen());
                },
              ),
            ],
          ),
        ],
      ),
      ShellRoute(
        navigatorKey: _onboardingNavigatorKey,
        builder: (context, state, child) {
          return OnboardingShell(child: child);
        },
        routes: [
          GoRoute(
            path: '/onboarding',
            name: TopLevelDestinations.onboarding.name,
            pageBuilder: (context, state) {
              return const MaterialPage(child: OnboardingScreen());
            },
            routes: [
              GoRoute(
                path: 'artist-profile',
                name: OnboardingSubRoutes.artistProfile.name,
                pageBuilder: (context, state) {
                  return const MaterialPage(child: ArtistProfileScreen());
                },
              ),
              GoRoute(
                path: 'workplace',
                name: OnboardingSubRoutes.workplace.name,
                pageBuilder: (context, state) {
                  return const MaterialPage(child: WorkplacesTypeScreen());
                },
                routes: [
                  GoRoute(
                    path: 'add',
                    name: WorkplaceSubRoutes.add.name,
                    pageBuilder: (context, state) {
                      final String selectedType =
                          state.pathParameters['selectedType']!;
                      return MaterialPage(
                          child:
                              AddWorkplaceScreen(selectedType: selectedType));
                    },
                  ),
                  GoRoute(
                    path: 'details/:id',
                    name: WorkplaceSubRoutes.details.name,
                    pageBuilder: (context, state) {
                      final String workplaceId = state.pathParameters['id']!;
                      return MaterialPage(
                          child:
                              WorkplaceDetailsScreen(workplaceId: workplaceId));
                    },
                  ),
                  GoRoute(
                    path: 'availabilities/:workplaceType',
                    name: WorkplaceSubRoutes.availabilities.name,
                    pageBuilder: (context, state) {
                      final WorkplaceTypes workplaceType = state
                          .pathParameters['workplaceType'] as WorkplaceTypes;
                      return MaterialPage(
                          child: WorkplaceAvailabilitiesScreen(
                              workplaceType: workplaceType));
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