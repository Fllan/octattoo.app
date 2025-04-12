import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:octattoo_flutter/core/providers/client_provider.dart';
import 'package:octattoo_flutter/core/providers/session_manager_provider.dart';
import 'package:octattoo_flutter/features/authentication/services/auth_service.dart';

part 'auth_service_provider.g.dart';

@riverpod
AuthService authService(Ref ref) {
  print("AuthServiceProvider init");
  return AuthService(
    ref.read(clientProvider),
    ref.read(sessionManagerProvider),
  );
}
