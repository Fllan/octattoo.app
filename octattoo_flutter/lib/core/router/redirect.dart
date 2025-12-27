import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_flutter/core/router/routes.dart';
import 'package:octattoo_flutter/core/serverpod_client_service.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

class RedirectRoute extends GoRouteData {
  final client = ServerpodClientService().client;
  @override
  String? redirect(BuildContext context, GoRouterState state) {
    final bool isLoggedIn = client.auth.isAuthenticated;
    final loggingIn = state.matchedLocation == AuthenticationRoute().location;
    if (!isLoggedIn && !loggingIn) {
      return const AuthenticationRoute().location;
    }
    if (isLoggedIn && loggingIn) {
      return const ArtistProfileRoute().location;
    }
    return null;
  }
}
