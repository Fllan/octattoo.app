import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/utils/logger.dart';
import 'package:octattoo_app/core/services/firebase/firebase_init_service.dart';
import 'package:octattoo_app/core/services/firebase/firebase_app_check_service.dart';
import 'package:octattoo_app/src/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLogger();

  await FirebaseInitService.initializeFirebase();
  await FirebaseAppCheckService.activateAppCheck();

  runApp(const ProviderScope(child: MyApp()));
}