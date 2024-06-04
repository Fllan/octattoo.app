import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app_mvp/core/services/initialize_services.dart';
import 'package:octattoo_app_mvp/src/my_app.dart';

Future<void> main() async {

  /// Enable debug zone errors are fatal
  BindingBase.debugZoneErrorsAreFatal = true;
  
  /// Initialize WidgetsBinding
  WidgetsFlutterBinding.ensureInitialized();
  
  /// Initialize Services
  await ServiceInitializer.initializeAllServices();

  runApp(const ProviderScope(child: MyApp()));
}
