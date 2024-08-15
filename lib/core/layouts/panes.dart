/// Enum representing the different types of panes.
enum PaneType {
  fixed,
  flexible,
}

/// Class representing an individual pane in a layout.
class Pane {
  final PaneType type;

  Pane({
    required this.type,
  });
}
