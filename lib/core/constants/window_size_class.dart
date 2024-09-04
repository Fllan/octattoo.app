// ignore: dangling_library_doc_comments
/// Inspired by Fredrick Allan Grott - https://github.com/fredgrott - https://fredgrott.substack.com/
/// Link to the original code:
/// https://github.com/fredgrott/master_flutter_adaptive/blob/master/md3_utils/lib/md3_utils/custom_window_size.dart

enum WindowSizeClass {
  compact(0, 599, 0, 900, 16, 0, 4),
  medium(600, 839, 480, 900, 24, 24, 8),
  expanded(840, 1199, 900, double.infinity, 24, 24, 12),
  large(1200, 1599, 900, double.infinity, 24, 24, 16),
  extraLarge(1600, double.infinity, 900, double.infinity, 24, 24, 20);

  const WindowSizeClass(
    this.beginWidthRange,
    this.endWidthRange,
    this.beginHeightRange,
    this.endHeightRange,
    this.margin,
    this.spacing,
    this.padding,
  );

  final double beginWidthRange;
  final double endWidthRange;
  final double beginHeightRange;
  final double endHeightRange;
  final double margin;
  final double spacing;
  final double padding;

  /// Below [minHeightCompact], [MyNavigationRail] is replaced by [CompactAppBar]
  static const double minHeightCompact = 504;
}

WindowSizeClass getWindowSizeClass(double width) {
  final currentWidth = width;

  final compactBeginWidthRange = WindowSizeClass.compact.beginWidthRange;
  final compactEndWidthRange = WindowSizeClass.compact.endWidthRange;
  final medBeginWidthRange = WindowSizeClass.medium.beginWidthRange;
  final medEndWidthRange = WindowSizeClass.medium.endWidthRange;
  final expBeginWidthRange = WindowSizeClass.expanded.beginWidthRange;
  final expEndWidthRange = WindowSizeClass.expanded.endWidthRange;
  final largeBeginWidthRange = WindowSizeClass.large.beginWidthRange;
  final largeEndWidthRange = WindowSizeClass.large.endWidthRange;
  final extraLargeBeginWidthRange = WindowSizeClass.extraLarge.beginWidthRange;
  final extraLargeEndWidthRange = WindowSizeClass.extraLarge.endWidthRange;

  if (currentWidth >= compactBeginWidthRange &&
      currentWidth <= compactEndWidthRange) {
    return WindowSizeClass.compact;
  } else if (currentWidth >= medBeginWidthRange &&
      currentWidth <= medEndWidthRange) {
    return WindowSizeClass.medium;
  } else if (currentWidth >= expBeginWidthRange &&
      currentWidth <= expEndWidthRange) {
    return WindowSizeClass.expanded;
  } else if (currentWidth >= largeBeginWidthRange &&
      currentWidth <= largeEndWidthRange) {
    return WindowSizeClass.large;
  } else if (currentWidth >= extraLargeBeginWidthRange &&
      currentWidth <= extraLargeEndWidthRange) {
    return WindowSizeClass.extraLarge;
  } else {
    return WindowSizeClass.compact;
  }
}

bool getIsHeightCompact(double height) {
  return height < WindowSizeClass.minHeightCompact;
}
