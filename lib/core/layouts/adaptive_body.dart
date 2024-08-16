import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/core/constants/primary_destinations.dart';
import 'package:octattoo_app/core/layouts/adaptive_navigation/my_navigation_drawer.dart';
import 'package:octattoo_app/core/layouts/adaptive_navigation/my_navigation_rail.dart';
import 'package:octattoo_app/core/layouts/adaptive_panes/fixed_pane.dart';
import 'package:octattoo_app/core/layouts/adaptive_panes/flexible_pane.dart';
import 'package:octattoo_app/core/layouts/bodies.dart';
import 'package:octattoo_app/core/layouts/navigations.dart';

class AdaptiveBody {
  static Widget createBody({
    required Navigation navigation,
    required Body body,
    required List<PrimaryDestination> destinations,
    required StatefulNavigationShell navigationShell,
  }) {
    final navWidget =
        _getNavigationWidget(navigation, destinations, navigationShell);

    switch (body.type) {
      case BodyType.singlePane:
        return _createSinglePaneBody(navWidget, body.layout);
      case BodyType.twoPane:
        return _createTwoPaneBody(navWidget, body.layout);
      default:
        return const Text('Unknown BodyType');
    }
  }

  static Widget _getNavigationWidget(
      Navigation navigation,
      List<PrimaryDestination> destinations,
      StatefulNavigationShell navigationShell) {
    switch (navigation.type) {
      case NavigationType.navigationRail:
        return MyNavigationRail(
            destinations: destinations, navigationShell: navigationShell);
      case NavigationType.navigationDrawer:
        return MyNavigationDrawer(
            destinations: destinations,
            navigationShell: navigationShell,
            isModal: false);
      default:
        return const SizedBox.shrink();
    }
  }

  static Widget _createSinglePaneBody(Widget nav, BodyLayout layout) {
    return Row(
      children: [
        nav,
        const FlexiblePane(
          child: Center(
            child: Text('Flexible Pane'),
          ),
        ),
      ],
    );
  }

  static Widget _createTwoPaneBody(Widget nav, BodyLayout layout) {
    switch (layout) {
      case BodyLayout.flexible:
        return Row(
          children: [
            nav,
            const FlexiblePane(
              child: Center(
                child: Text('Flexible Pane'),
              ),
            ),
            const FlexiblePane(
              child: Center(
                child: Text('Flexible Pane'),
              ),
            ),
          ],
        );
      case BodyLayout.firstFixed:
        return Row(
          children: [
            nav,
            const FixedPane(
              child: Center(
                child: Text('Fixed Pane'),
              ),
            ),
            const FlexiblePane(
              child: Center(
                child: Text('Flexible Pane'),
              ),
            ),
          ],
        );
      case BodyLayout.secondFixed:
        return Row(
          children: [
            nav,
            const FlexiblePane(
              child: Center(
                child: Text('Flexible Pane'),
              ),
            ),
            const FixedPane(
              child: Center(
                child: Text('Fixed Pane'),
              ),
            ),
          ],
        );
    }
  }
}
