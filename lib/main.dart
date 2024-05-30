import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app_mvp/core/services/initialize_services.dart';
import 'package:octattoo_app_mvp/src/my_app.dart';

Future<void> main() async {
  
  /// Initialize WidgetsBinding
  WidgetsFlutterBinding.ensureInitialized();
  
  /// Initialize Services
  await ServiceInitializer.initializeAllServices();

  runApp(const ProviderScope(child: MyApp()));
}
