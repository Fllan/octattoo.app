import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/core/constants/primary_destinations.dart';
import 'package:octattoo_app/core/constants/window_size_class.dart';
import 'package:octattoo_app/core/layouts/adaptive_scaffold/compact_scaffold.dart';
import 'package:octattoo_app/core/layouts/adaptive_scaffold/expanded_scaffold.dart';
import 'package:octattoo_app/core/layouts/adaptive_scaffold/extra_large_scaffold.dart';
import 'package:octattoo_app/core/layouts/adaptive_scaffold/large_scaffold.dart';
import 'package:octattoo_app/core/layouts/adaptive_scaffold/medium_scaffold.dart';
import 'package:octattoo_app/core/utils/logger.dart';

class ResponsiveLayout extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  final List<PrimaryDestination> destinations;
  final GoRouterState goRouterState;

  const ResponsiveLayout({
    super.key,
    required this.navigationShell,
    required this.destinations,
    required this.goRouterState,
  });

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  WindowSizeClass currentWindowSizeClass = WindowSizeClass.compact;
  bool currentIsHeightCompact = false;

  @override
  Widget build(BuildContext context) {
    // logger.d('AdaptiveScaffold: build');
    final currentSize = MediaQuery.sizeOf(context);
    final currentWidth = currentSize.width;
    final currentHeight = currentSize.height;

    if (currentWidth <= WindowSizeClass.medium.endWidthRange) {
      return CompactScaffold(
        key: widget.goRouterState.pageKey,
        navigationShell: widget.navigationShell,
        destinations: widget.destinations,
        goRouterState: widget.goRouterState,
      );
    } else {
      final isHeightCompact = getIsHeightCompact(currentHeight);
      return ExpandedScaffold(
        key: widget.goRouterState.pageKey,
        navigationShell: widget.navigationShell,
        isHeightCompact: isHeightCompact,
        destinations: widget.destinations,
        goRouterState: widget.goRouterState,
      );
    }

    // return Consumer(builder: (context, ref, _) {
    //   final currentBreakpoint = ref.watch(currentBreakpointProvider);
    //   if (currentBreakpoint.windowSizeClass == WindowSizeClass.compact) {
    //     return CompactScaffold(
    //       key: widget.goRouterState.pageKey,
    //       navigationShell: widget.navigationShell,
    //       isHeightCompact: currentBreakpoint.isHeightCompact,
    //       destinations: widget.destinations,
    //       goRouterState: widget.goRouterState,
    //     );
    //   } else if (currentBreakpoint.windowSizeClass == WindowSizeClass.medium) {
    //     return MediumScaffold(
    //       key: widget.goRouterState.pageKey,
    //       navigationShell: widget.navigationShell,
    //       isHeightCompact: currentBreakpoint.isHeightCompact,
    //       destinations: widget.destinations,
    //       goRouterState: widget.goRouterState,
    //     );
    //   } else if (currentBreakpoint.windowSizeClass ==
    //       WindowSizeClass.expanded) {
    //     return ExpandedScaffold(
    //       key: widget.goRouterState.pageKey,
    //       navigationShell: widget.navigationShell,
    //       isHeightCompact: currentBreakpoint.isHeightCompact,
    //       destinations: widget.destinations,
    //       goRouterState: widget.goRouterState,
    //     );
    //   } else if (currentBreakpoint.windowSizeClass == WindowSizeClass.large) {
    //     return ExpandedScaffold(
    //       key: widget.goRouterState.pageKey,
    //       navigationShell: widget.navigationShell,
    //       isHeightCompact: currentBreakpoint.isHeightCompact,
    //       destinations: widget.destinations,
    //       goRouterState: widget.goRouterState,
    //     );
    //   } else if (currentBreakpoint.windowSizeClass ==
    //       WindowSizeClass.extraLarge) {
    //     return ExpandedScaffold(
    //       key: widget.goRouterState.pageKey,
    //       navigationShell: widget.navigationShell,
    //       isHeightCompact: currentBreakpoint.isHeightCompact,
    //       destinations: widget.destinations,
    //       goRouterState: widget.goRouterState,
    //     );
    //   } else {
    //     return ErrorWidget.withDetails(
    //       message: 'AdaptiveScaffold: No layout found for $currentBreakpoint',
    //       error: FlutterError(
    //           'AdaptiveScaffold: No layout found for $currentBreakpoint'),
    //     );
    //   }
    // });
  }
}
