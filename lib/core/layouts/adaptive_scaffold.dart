import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/core/constants/primary_destinations.dart';
import 'package:octattoo_app/core/layouts/adaptive_body.dart';
import 'package:octattoo_app/core/layouts/adaptive_navigation/modal_drawer.dart';
import 'package:octattoo_app/core/layouts/bodies.dart';
import 'package:octattoo_app/core/layouts/navigations.dart';

class AdaptiveScaffold extends StatelessWidget {
  const AdaptiveScaffold({
    super.key,
    required this.navigation,
    required this.body,
    required this.destinations,
    required this.navigationShell,
    required this.firstPane,
    this.secondPane,
  });

  final Navigation navigation;
  final Body body;
  final List<PrimaryDestination> destinations;
  final StatefulNavigationShell navigationShell;
  final Widget firstPane;
  final Widget? secondPane;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).colorScheme.surface;
    final appBar = buildAppBar(context);
    bool isCompactAppBar = navigation.type == NavigationType.compactAppBar;
    final extendBodyBehindAppBar = isCompactAppBar;
    final bodyScaffold = AdaptiveBody.createBody(
      navigation: navigation,
      body: body,
      destinations: destinations,
      navigationShell: navigationShell,
      firstPane: firstPane,
      secondPane: secondPane,
    );
    final drawer = buildDrawer(context);

    return Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      body: bodyScaffold,
      drawer: drawer,
    );
  }

  PreferredSizeWidget? buildAppBar(BuildContext context) {
    switch (navigation.type) {
      case NavigationType.appBar:
        return AppBar(
          title: const Text('AppBar'),
        );
      case NavigationType.compactAppBar:
        return AppBar(
          title: null,
          backgroundColor: Colors.transparent,
        );
      case NavigationType.navigationRail:
        return null;
      case NavigationType.navigationDrawer:
        return null;
    }
  }

  Widget? buildDrawer(BuildContext context) {
    if (navigation.type != NavigationType.navigationDrawer) {
      return ModalDrawer(
          destinations: destinations, navigationShell: navigationShell);
    } else {
      return null;
    }
  }
}
