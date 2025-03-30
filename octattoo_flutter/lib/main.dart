import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_flutter/core/providers/session_manager_provider.dart';
import 'package:octattoo_flutter/features/authentication/providers/auth_service_provider.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

void main() {
  // Need to call this as we are using Flutter bindings before runApp is called.
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSignedIn = ref.watch(sessionManagerProvider).isSignedIn;
    UserInfo? signedInUser;
    if (isSignedIn) {
      signedInUser =
          ref.watch(sessionManagerProvider).signedInUser as UserInfo?;
    }
    return MaterialApp(
      title: 'Serverpod Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Consumer(
        builder: (context, ref, _) {
          return Scaffold(
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ref.read(authServiceProvider).registerWithEmail(
                            email: "test@fllan.net",
                            password: "soleil123",
                            username: "test fllan",
                          );
                    },
                    child: Text("Register With Email"),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(authServiceProvider).confirmEmailRegister(
                            email: "test@fllan.net",
                            verificationCode: "Ru3DRg3s",
                          );
                    },
                    child: Text("Confirm Email"),
                  ),
                  SizedBox(height: 20),
                  Visibility(
                    visible: isSignedIn,
                    child: Text("User logged in : $signedInUser"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
