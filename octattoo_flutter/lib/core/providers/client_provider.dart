import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_client/octattoo_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

part 'client_provider.g.dart';

@riverpod
Client client(Ref ref) {
  return Client(
    'http://$localhost:8080/',
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();
}
