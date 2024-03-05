import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/services/auth.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});