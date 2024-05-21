import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A FutureProvider for SharedPreferences.
/// This will provide an instance of SharedPreferences when it's ready.
final sharedPreferencesFutureProvider = FutureProvider<SharedPreferences>((ref) async {
  try {
    // Try to get an instance of SharedPreferences
    return await SharedPreferences.getInstance();
  } catch (e) {
    // Log or handle the error here
    throw Exception('Failed to get SharedPreferences: $e');
  }
});