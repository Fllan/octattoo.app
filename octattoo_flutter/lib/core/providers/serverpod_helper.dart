import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_client/octattoo_client.dart';
import 'package:octattoo_flutter/core/providers/client_provider.dart';
import 'package:octattoo_flutter/core/providers/session_manager_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

part 'serverpod_helper.g.dart';

// * Many thanks to Ben Auer for this approach ♥
// * https://medium.com/@ben.auer.dev/flashlist-part-1-serverpod-riverpod-serverriverpodpod-f3e99819996b

class ServerpodHelper {
  ServerpodHelper(this.client, this.sessionManager) {
    sessionManager.initialize();
  }

  final Client client;
  final SessionManager sessionManager;
}

@riverpod
ServerpodHelper serverpodHelper(Ref ref) => ServerpodHelper(
      ref.watch(clientProvider),
      ref.watch(sessionManagerProvider),
    );
