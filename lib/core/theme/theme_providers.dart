import 'package:flutter/material.dart';
import 'package:octattoo_app/core/constants/theme.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_providers.g.dart';

@riverpod
Brightness selectedBrightness(SelectedBrightnessRef ref) {
  return Brightness.light;
}

@riverpod
ColorSeed selectedAccentColor(SelectedAccentColorRef ref) {
  return ColorSeed.deepOrange;
}

@riverpod
ColorImage selectedColorImage(SelectedColorImageRef ref) {
  return ColorImage.seaweed;
}
