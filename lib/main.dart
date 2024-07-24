import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app_mvp/core/utils/utils_initializer.dart';
import 'package:octattoo_app_mvp/src/my_app.dart';

Future<void> main() async {
  /// Enable debug zone errors are fatal
  BindingBase.debugZoneErrorsAreFatal = true;

  /// Initialize WidgetsBinding
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize Utils
  UtilsInitializer.initializeAllUtils();

  /// Run the app
  runApp(const ProviderScope(child: MyApp()));
}
