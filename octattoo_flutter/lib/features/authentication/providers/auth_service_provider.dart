import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_flutter/core/providers/client_provider.dart';
import 'package:octattoo_flutter/core/providers/session_manager_provider.dart';
import 'package:octattoo_flutter/features/authentication/services/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_service_provider.g.dart';

@riverpod
AuthService authService(Ref ref) {
  return AuthService(
      ref.read(clientProvider), ref.read(sessionManagerProvider));
}
