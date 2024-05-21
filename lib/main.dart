import 'package:flutter/material.dart';
import 'package:octattoo_app/core/utils/env.dart';
import 'package:octattoo_app/core/utils/logger.dart';
import 'package:octattoo_app/core/services/firebase_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/src/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLogger();
  setupEnv();
  await FirebaseService.initializeAll();

  runApp(const ProviderScope(child: MyApp()));
}