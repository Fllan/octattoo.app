import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_flutter/core/providers/client_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

part 'session_manager_provider.g.dart';

@riverpod
// ignore: unsupported_provider_value
SessionManager sessionManager(Ref ref) {
  return SessionManager(
    caller: ref.read(clientProvider).modules.auth,
  );
}
