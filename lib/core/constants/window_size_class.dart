// ignore: dangling_library_doc_comments
/// Inspired by Fredrick Allan Grott - https://github.com/fredgrott - https://fredgrott.substack.com/
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
