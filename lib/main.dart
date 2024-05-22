import 'package:flutter/material.dart';
import 'package:octattoo_app/core/utils/env.dart';
import 'package:octattoo_app/core/utils/logger.dart';
import 'package:octattoo_app/core/services/firebase_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/src/my_app.dart';

Future<void> main() async {
  // Ensure that widget binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Setup logger and environment
  setupLogger();
  setupEnv();

  try {
    // Initialize Firebase services
    await FirebaseService.initializeAll();
  } catch (e) {
    // Handle or log the error here
    logger.e('Failed to initialize Firebase services: $e');
    return;
  }

  // Run the app
  runApp(const ProviderScope(child: MyApp()));
}
