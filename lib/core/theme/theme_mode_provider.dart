import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A StateProvider for ThemeMode.
/// This will provide the current theme mode and allow it to be changed.
final themeModeProvider = StateProvider<ThemeMode>((ref) {
  // Set the initial theme mode to system.
  // This can be changed to light or dark as needed.
  return ThemeMode.system;
});