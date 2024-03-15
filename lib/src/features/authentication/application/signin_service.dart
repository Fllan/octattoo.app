import 'package:flutter_riverpod/flutter_riverpod.dart';

class SigninService {
  SigninService({required this.ref});
  final Ref ref;



}

final signinServiceProvider =
    Provider<SigninService>((ref) => SigninService(ref: ref));