import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_flutter/features/authentication/models/auth_state.dart';
import 'package:octattoo_flutter/features/authentication/providers/auth_provider.dart';
import 'package:octattoo_flutter/features/authentication/providers/auth_service_provider.dart';
import 'package:octattoo_flutter/features/user/providers/user_service_provider.dart';

void main() {
  // Need to call this as we are using Flutter bindings before runApp is called.
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  bool booting = true;

  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    print("await ref.read(authProvider.notifier).init();");
    await ref.read(authProvider.notifier).init();
    setState(() {
      booting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serverpod Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Consumer(
        builder: (context, ref, _) {
          if (booting) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          } else {
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
                      onPressed: () async {
                        ref.read(authServiceProvider).registerWithEmail(
                              email: "test@fllan.net",
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
                              email: "test@fllan.net",
                              verificationCode: "gpdZ4uw5",
                            );
                      },
                      child: Text("Confirm Email"),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        final userInfo =
                            await ref.read(authServiceProvider).loginWithEmail(
                                  email: "test@fllan.net",
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
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        final result =
                            await ref.read(authServiceProvider).logout();
                        result.fold((error) {
                          print(error);
                        }, (_) {
                          print("LOGOOOOOUT");
                        });
                      },
                      child: Text("Logout"),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        final result =
                            await ref.read(userServiceProvider).currentUser();
                        result.fold((error) {
                          print(error);
                        }, (user) {
                          print(user);
                        });
                      },
                      child:
                          Text("ref.read(userServiceProvider).currentUser()"),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        final result =
                            ref.read(authServiceProvider).currentUserInfo();
                        result.fold((error) {
                          print(error);
                        }, (userInfo) {
                          print(userInfo);
                        });
                      },
                      child: Text(
                          "ref.read(authServiceProvider).currentUserInfo()"),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
