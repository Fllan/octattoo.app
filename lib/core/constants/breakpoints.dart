import 'package:flutter/material.dart';

/// An enum that represents the different breakpoints.
enum BreakpointType {
  compact,
  medium,
  expanded,
  large,
  extraLarge;

  static const double _compactWidth = 600;
  static const double _mediumWidth = 840;
  static const double _expandedWidth = 1200;
  static const double _largeWidth = 1600;
  static const double _minHeight = 504;

  /// Returns the corresponding [BreakpointType] based on the screen width.
  static BreakpointType fromWidth(double width) {
    if (width < _compactWidth) return BreakpointType.compact;
    if (width < _mediumWidth) return BreakpointType.medium;
    if (width < _expandedWidth) return BreakpointType.expanded;
    if (width < _largeWidth) return BreakpointType.large;
    return BreakpointType.extraLarge;
  }

  /// Convenience method to get the current [BreakpointType] from the context.
  static BreakpointType fromContext(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return fromWidth(width);
  }

  /// Determines if the height is compact.
  static bool isHeightCompact(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return height < _minHeight;
  }
}

/// A class that provides a convenient way to access the current breakpoint.
class Breakpoint {
  final BreakpointType type;
  final bool isHeightCompact;

  Breakpoint(BuildContext context)
      : type = BreakpointType.fromContext(context),
        isHeightCompact = BreakpointType.isHeightCompact(context);

  bool get isCompact => type == BreakpointType.compact;
  bool get isMedium => type == BreakpointType.medium;
  bool get isExpanded => type == BreakpointType.expanded;
  bool get isLarge => type == BreakpointType.large;
  bool get isExtraLarge => type == BreakpointType.extraLarge;
}
