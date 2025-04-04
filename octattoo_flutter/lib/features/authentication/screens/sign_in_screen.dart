import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_flutter/features/authentication/models/auth_state.dart';
import 'package:octattoo_flutter/features/authentication/providers/auth_provider.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Builder(builder: (context) {
              switch (authState) {
                case AuthStateSuccess():
                  return Text(
                      "Hello User : ${authState.user.userInfo?.userName} !");
                case AuthStateGuest():
                  return Text("Hello Guest !");
                default:
                  return Text("...");
              }
            }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ref.read(authProvider.notifier).loginWithEmail(
                      email: "test@fllan.net",
                      password: "soleil123",
                    );
              },
              child: Text("Login with Email"),
            ),
          ],
        ),
      ),
    );
  }
}
