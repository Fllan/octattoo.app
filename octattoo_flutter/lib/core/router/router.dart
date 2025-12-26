import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_flutter/core/router/redirect.dart';
import 'package:octattoo_flutter/core/router/routes.dart';
import 'package:octattoo_flutter/core/serverpod_client_service.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final client = ServerpodClientService().client;

final router = GoRouter(
  routes: $appRoutes,
  navigatorKey: rootNavigatorKey,
  refreshListenable: client.auth.authInfoListenable,
  redirect: RedirectRoute().redirect,
);
