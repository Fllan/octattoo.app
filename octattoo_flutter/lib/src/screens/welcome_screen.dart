import 'package:flutter/material.dart';
import 'package:octattoo_flutter/core/serverpod_client_service.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'package:octattoo_flutter/src/shared/material_text.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final client = ServerpodClientService().client;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              MaterialText.headlineMedium(
                'Welcome to Octattoo App',
                context,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await client.auth.signOutDevice();
                },
                child: MaterialText.labelLarge('Sign out', context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
