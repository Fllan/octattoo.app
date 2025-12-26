import 'package:octattoo_client/octattoo_client.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

class ServerpodClientService {
  static final ServerpodClientService _instance =
      ServerpodClientService._internal();

  factory ServerpodClientService() => _instance;

  ServerpodClientService._internal();

  late final Client client;

  Future<void> initialize(String serverUrl) async {
    client = Client(serverUrl)
      ..connectivityMonitor = FlutterConnectivityMonitor()
      ..authSessionManager = FlutterAuthSessionManager();
    await client.auth.initialize();
  }
}
