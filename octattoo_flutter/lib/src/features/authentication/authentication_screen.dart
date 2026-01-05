import 'package:flutter/material.dart';
import 'package:octattoo_flutter/core/serverpod_client_service.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final client = ServerpodClientService().client;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SignInWidget(
            client: client,
            emailSignInWidget: EmailSignInWidget(
              client: client,
              startScreen: .startRegistration,
            ),
          ),
        ),
      ),
    );
  }
}
