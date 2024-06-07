import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app_mvp/core/constants/gaps.dart';
import 'package:octattoo_app_mvp/core/services/firebase/authentication/authentication_repository.dart';
import 'package:octattoo_app_mvp/src/shared/form_validators.dart';

class ForgotPasswordScreen extends ConsumerWidget {
  ForgotPasswordScreen({super.key});

  final GlobalKey<FormState> _key = GlobalKey();
  final _email = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Forgot password',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              gapH12,
              const Text(
                'Please fill out your email below in order to receive a reset password link.',
                style: TextStyle(fontSize: 16),
              ),
              gapH20,
              TextFormField(
                validator: emailValidator,
                controller: _email,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              gapH20,
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      ref.watch(authRepositoryProvider).sendPasswordResetEmail(_email.text, context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text('Send reset link'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}