import 'package:flutter/material.dart';

/// Enum representing the different types of panes.
enum PaneType {
  fixed,
  flexible,
}

/// Class representing an individual pane in a layout.
class Pane {
  final double? width;
  final Widget child;
  final ShapeBorder shape;
  final double elevation;
  final EdgeInsetsGeometry padding;

  Pane({
    this.width,
    required this.child,
    this.shape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    this.elevation = 0,
    this.padding = const EdgeInsets.all(16.0),
  });
}
