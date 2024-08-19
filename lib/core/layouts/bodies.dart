import 'package:flutter/material.dart';
import 'package:octattoo_app/core/constants/breakpoints.dart';

/// Enum representing the high-level structure of the body.
enum BodyType {
  singlePane,
  twoPane,
}

/// Enum representing the specific layout configuration of the body.
enum BodyLayout {
  flexible, // Single pane or both panes flexible
  firstFixed, // First pane fixed, second flexible
  secondFixed, // First pane flexible, second fixed
}

/// Class representing the body, based on the type and layout.
class Body {
  final BodyType type;
  final BodyLayout layout;

  Body(this.type, this.layout);
}

/// Type alias for overriding body layouts based on breakpoints.
typedef BodyOverride = Map<BreakpointType, Body>;

/// Returns the default [Body] layout based on the current [BreakpointType].
Body getDefaultBody(BuildContext context) {
  final breakpoint = Breakpoint(context);
  switch (breakpoint.type) {
    case BreakpointType.compact:
    case BreakpointType.medium:
      return Body(BodyType.singlePane, BodyLayout.flexible);
    case BreakpointType.expanded:
      return Body(BodyType.twoPane, BodyLayout.flexible);
    case BreakpointType.large:
      return Body(BodyType.twoPane, BodyLayout.firstFixed);
    case BreakpointType.extraLarge:
      return Body(BodyType.twoPane, BodyLayout.secondFixed);
  }
}

/// Returns the [Body] based on the current [Breakpoint] and any overrides provided from [PrimaryDestination].
Body getBody(
  BuildContext context, {
  BodyOverride? overrides,
}) {
  final breakpoint = Breakpoint(context);
  if (overrides != null && overrides.containsKey(breakpoint.type)) {
    return overrides[breakpoint.type]!;
  }
  return getDefaultBody(context);
}
