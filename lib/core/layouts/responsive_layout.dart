import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app/core/constants/primary_destinations.dart';
import 'package:octattoo_app/core/constants/window_size_class.dart';
import 'package:octattoo_app/core/layouts/adaptive_scaffold/compact_scaffold.dart';
import 'package:octattoo_app/core/utils/logger.dart';

class ResponsiveLayout extends StatelessWidget {
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
  Widget build(BuildContext context) {
    logger.d('AdaptiveScaffold: build');
    return LayoutBuilder(builder: (context, constraints) {
      final currentWidth = constraints.maxWidth;
      final currentHeight = constraints.maxHeight;
      final isHeightCompact = currentHeight < WindowSizeClass.minHeightCompact;

      final compactBeginWidthRange = WindowSizeClass.compact.beginWidthRange;
      final compactEndWidthRange = WindowSizeClass.compact.endWidthRange;
      final medBeginWidthRange = WindowSizeClass.medium.beginWidthRange;
      final medEndWidthRange = WindowSizeClass.medium.endWidthRange;
      final expBeginWidthRange = WindowSizeClass.expanded.beginWidthRange;
      final expEndWidthRange = WindowSizeClass.expanded.endWidthRange;
      final largeBeginWidthRange = WindowSizeClass.large.beginWidthRange;
      final largeEndWidthRange = WindowSizeClass.large.endWidthRange;
      final extraLargeBeginWidthRange =
          WindowSizeClass.extraLarge.beginWidthRange;
      final extraLargeEndWidthRange = WindowSizeClass.extraLarge.endWidthRange;

      if (currentWidth >= compactBeginWidthRange &&
          currentWidth <= compactEndWidthRange) {
        logger.d(
            'AdaptiveScaffold: return CompactScaffold(isHeightCompact: $isHeightCompact)');
        return CompactScaffold(
          key: goRouterState.pageKey,
          navigationShell: navigationShell,
          isHeightCompact: isHeightCompact,
          destinations: destinations,
          goRouterState: goRouterState,
        );
      } else if (currentWidth >= medBeginWidthRange &&
          currentWidth <= medEndWidthRange) {
        logger.d(
            'AdaptiveScaffold: return MediumScaffold(isHeightCompact: $isHeightCompact)');
        return CompactScaffold(
          navigationShell: navigationShell,
          isHeightCompact: isHeightCompact,
          destinations: destinations,
          goRouterState: goRouterState,
        );
        // return MediumScaffold(
        //   navigationShell: navigationShell,
        //   isHeightCompact: isHeightCompact,
        // );
      } else if (currentWidth >= expBeginWidthRange &&
          currentWidth <= expEndWidthRange) {
        logger.d(
            'AdaptiveScaffold: return ExpandedScaffold(isHeightCompact: $isHeightCompact)');
        return CompactScaffold(
          navigationShell: navigationShell,
          isHeightCompact: isHeightCompact,
          destinations: destinations,
          goRouterState: goRouterState,
        );
        // return ExpandedScaffold(
        //   navigationShell: navigationShell,
        //   isHeightCompact: isHeightCompact,
        // );
      } else if (currentWidth >= largeBeginWidthRange &&
          currentWidth <= largeEndWidthRange) {
        logger.d(
            'AdaptiveScaffold: return LargeScaffold(isHeightCompact: $isHeightCompact)');
        return CompactScaffold(
          navigationShell: navigationShell,
          isHeightCompact: isHeightCompact,
          destinations: destinations,
          goRouterState: goRouterState,
        );
        // return LargeScaffold(
        //   navigationShell: navigationShell,
        //   isHeightCompact: isHeightCompact,
        // );
      } else if (currentWidth >= extraLargeBeginWidthRange &&
          currentWidth <= extraLargeEndWidthRange) {
        logger.d(
            'AdaptiveScaffold: return ExtraLargeScaffold(isHeightCompact: $isHeightCompact)');
        return CompactScaffold(
          navigationShell: navigationShell,
          isHeightCompact: isHeightCompact,
          destinations: destinations,
          goRouterState: goRouterState,
        );
        // return ExtraLargeScaffold(
        //   navigationShell: navigationShell,
        //   isHeightCompact: isHeightCompact,
        // );
      } else {
        logger.d('AdaptiveScaffold: return error');
        return ErrorWidget.withDetails(
          message: 'AdaptiveScaffold: No layout found for $currentWidth',
          error: FlutterError(
              'AdaptiveScaffold: No layout found for $currentWidth'),
        );
      }
    });
  }
}
