import 'package:octattoo_flutter/core/serverpod_client_service.dart';
import 'package:octattoo_client/octattoo_client.dart';

/// Simple service locator for manual dependency injection.
///
/// This provides a centralized place to:
/// - Initialize and configure dependencies
/// - Provide access to repositories
/// - Create ViewModels with their dependencies
///
/// Usage:
/// 1. Call ServiceLocator.initialize() at app startup
/// 2. Access dependencies via ServiceLocator.instance
/// 3. Create ViewModels by calling their constructors with dependencies
///
/// This follows manual constructor dependency injection principles
/// while providing convenient access to shared services.
class ServiceLocator {
  ServiceLocator._();

  static final ServiceLocator _instance = ServiceLocator._();
  static ServiceLocator get instance => _instance;

  late final Client _serverpodClient;

  /// Initialize the service locator with required dependencies
  static void initialize() {
    _instance._serverpodClient = ServerpodClientService().client;
  }

  /// Get the Serverpod client for API calls
  Client get serverpodClient => _serverpodClient;

  /// Create and return a new instance with dependencies
  /// This allows for easy testing by injecting mock dependencies
  T create<T>(T Function(ServiceLocator locator) factory) {
    return factory(this);
  }
}
