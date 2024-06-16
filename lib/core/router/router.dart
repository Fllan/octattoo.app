import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app_mvp/core/router/redirections/redirect.dart';
import 'package:octattoo_app_mvp/core/router/routes.dart';
import 'package:octattoo_app_mvp/core/router/shells/onboarding_shell.dart';
import 'package:octattoo_app_mvp/core/router/shells/welcome_shell.dart';
import 'package:octattoo_app_mvp/src/onboarding/onboarding_screen.dart';
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
          ),
          GoRoute(
            path: '/welcome/signin',
            name: WelcomeSubRoutes.signin.name,
            pageBuilder: (context, state) {
              return MaterialPage(child: SignInScreen());
            },
          ),
          GoRoute(
            path: '/welcome/register',
            name: WelcomeSubRoutes.register.name,
            pageBuilder: (context, state) {
              return MaterialPage(child: RegisterScreen());
            },
          ),
          GoRoute(
            path: '/welcome/signin/forgot-password',
            name: SignInSubRoutes.forgotPassword.name,
            pageBuilder: (context, state) {
              return MaterialPage(child: ForgotPasswordScreen());
            },
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
          ),
          // GoRoute(
          //   path: '/onboarding/artist-profile',
          //   name: OnboardingSubRoutes.artistProfile.name,
          //   pageBuilder: (context, state) {
          //     return const MaterialPage(child: ArtistProfileScreen());
          //   },
          // ),
          // GoRoute(
          //   path: '/onboarding/workplace',
          //   name: OnboardingSubRoutes.workplace.name,
          //   pageBuilder: (context, state) {
          //     return const MaterialPage(child: CreateWorkplaceScreen());
          //   },
          // ),
          // GoRoute(
          //   path: '/onboarding/workplace/add',
          //   name: WorkplaceSubRoutes.add.name,
          //   pageBuilder: (context, state) {
          //     return const MaterialPage(child: AddWorkplaceScreen());
          //   },
          // ),
          // GoRoute(
          //   path: '/onboarding/workplace/details',
          //   name: WorkplaceSubRoutes.details.name,
          //   pageBuilder: (context, state) {
          //     return const MaterialPage(child: WorkplaceDetailsScreen());
          //   },
          // ),
        ],
      ),
    ],
  );
}
