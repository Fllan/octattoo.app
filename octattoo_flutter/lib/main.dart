import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_flutter/features/authentication/providers/auth_service_provider.dart';

void main() {
  // Need to call this as we are using Flutter bindings before runApp is called.
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                            email: "test1@fllan.net",
                            password: "soleil123",
                            username: "fllan1",
                          );
                    },
                    child: Text("Register With Email"),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(authServiceProvider).confirmEmailRegister(
                            email: "test1@fllan.net",
                            verificationCode: "utiC22oZ",
                          );
                    },
                    child: Text("Confirm Email"),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      final userInfo =
                          await ref.read(authServiceProvider).loginWithEmail(
                                email: "test1@fllan.net",
                                password: "soleil123",
                              );

                      userInfo.fold((error) {
                        print(error);
                      }, (userInfo) {
                        print(userInfo);
                      });
                    },
                    child: Text("Login with Email"),
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
