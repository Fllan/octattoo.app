import 'package:octattoo_client/octattoo_client.dart';
import 'package:flutter/material.dart';
import 'package:octattoo_flutter/core/locale/memory_locale_repository.dart';
import 'package:octattoo_flutter/core/locale/locale_controller.dart';
import 'package:octattoo_flutter/core/serverpod_client_service.dart';
import 'package:octattoo_flutter/core/theme/memory_theme_repository.dart';
import 'package:octattoo_flutter/core/theme/theme_controller.dart';
import 'package:octattoo_flutter/src/octattoo_app.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'config/app_config.dart';

/// Sets up a global client object that can be used to talk to the server from
/// anywhere in our app. The client is generated from your server code
/// and is set up to connect to a Serverpod running on a local server on
/// the default port. You will need to modify this to connect to staging or
/// production servers.
/// In a larger app, you may want to use the dependency injection of your choice
/// instead of using a global client object. This is just a simple example.
late final Client client;

late String serverUrl;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // When you are running the app on a physical device, you need to set the
  // server URL to the IP address of your computer. You can find the IP
  // address by running `ipconfig` on Windows or `ifconfig` on Mac/Linux.
  // You can set the variable when running or building your app like this:
  // E.g. `flutter run --dart-define=SERVER_URL=https://api.example.com/`
  const serverUrlFromEnv = String.fromEnvironment('SERVER_URL');
  // AppConfig loads the API server URL from the assets/config.json file.
  // When the app runs in a browser, this file is fetched from the server,
  // allowing the server to change the API URL at runtime.
  // This ensures the app always uses the correct API URL,
  // no matter which environment it is running in.
  final config = await AppConfig.loadConfig();
  final serverUrl = serverUrlFromEnv.isEmpty
      ? config.apiUrl ?? 'http://$localhost:8080/'
      : serverUrlFromEnv;

  await ServerpodClientService().initialize(serverUrl);

  // Initialize theme controller
  final themeController = ThemeController(MemoryThemeRepository());
  await themeController.initialize();

  // Initialize locale controller
  final localeController = LocaleController(MemoryLocaleRepository());
  await localeController.initialize();

  runApp(
    OctattooApp(
      themeController: themeController,
      localeController: localeController,
    ),
  );
}
