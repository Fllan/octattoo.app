import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_flutter/core/providers/client_provider.dart';
import 'package:octattoo_flutter/features/authentication/user/services/user_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_service_provider.g.dart';

@riverpod
UserService userService(Ref ref) {
  return UserService(ref.read(clientProvider));
}
