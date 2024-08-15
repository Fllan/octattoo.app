import 'package:flutter/material.dart';
import 'package:octattoo_app/core/constants/breakpoints.dart';

/// Enum representing the different types of navigation.
enum NavigationType {
  appBar,
  compactAppBar,
  navigationRail,
  navigationDrawer,
}

/// Class representing the navigation type.
class Navigation {
  final NavigationType type;
  Navigation(this.type);
}

/// Returns the [Navigation] based on the current [BreakpointType].
Navigation getNavigation(BuildContext context) {
  final breakpoint = Breakpoint(context);

  if (breakpoint.isHeightCompact) {
    return Navigation(NavigationType.compactAppBar);
  }

  switch (breakpoint.type) {
    case BreakpointType.compact:
      return Navigation(NavigationType.appBar);
    case BreakpointType.medium:
    case BreakpointType.expanded:
    case BreakpointType.large:
      return Navigation(NavigationType.navigationRail);
    case BreakpointType.extraLarge:
      return Navigation(NavigationType.navigationDrawer);
  }
}
