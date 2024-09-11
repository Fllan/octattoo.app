import 'package:flutter/material.dart';

enum Breakpoints {
  compact,
  medium,
  expanded,
  large,
  extraLarge,
}

enum AdaptiveScaffoldType {
  appBar,
  compactAppBar,
  navigationRail,
  navigationDrawer,
}

extension BreakpointsExtension on Breakpoints {
  static const double compact = 600;
  static const double medium = 840;
  static const double expanded = 1200;
  static const double large = 1600;
  static const double minHeight = 504;

  static bool isCompact(BuildContext context) {
    return MediaQuery.sizeOf(context).width < compact;
  }

  static bool isMedium(BuildContext context) {
    return MediaQuery.sizeOf(context).width >= compact &&
        MediaQuery.sizeOf(context).width < medium;
  }

  static bool isExpanded(BuildContext context) {
    return MediaQuery.sizeOf(context).width >= medium &&
        MediaQuery.sizeOf(context).width < expanded;
  }

  static bool isLarge(BuildContext context) {
    return MediaQuery.sizeOf(context).width >= expanded &&
        MediaQuery.sizeOf(context).width < large;
  }

  static bool isExtraLarge(BuildContext context) {
    return MediaQuery.sizeOf(context).width >= large;
  }

  static bool isHeightCompact(BuildContext context) {
    return MediaQuery.sizeOf(context).height < minHeight;
  }

  static AdaptiveScaffoldType getScaffold(BuildContext context) {
    if (isCompact(context)) return AdaptiveScaffoldType.appBar;
    if (isMedium(context)) return AdaptiveScaffoldType.navigationRail;
    if (isExpanded(context)) return AdaptiveScaffoldType.navigationRail;
    if (isLarge(context)) return AdaptiveScaffoldType.navigationRail;
    if (isExtraLarge(context)) return AdaptiveScaffoldType.navigationDrawer;
    throw ErrorWidget.withDetails(
      message: 'Breakpoint not handled for ${MediaQuery.sizeOf(context).width}',
    );
  }
}
