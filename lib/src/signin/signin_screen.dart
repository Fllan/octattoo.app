import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app_mvp/core/constants/gaps.dart';
import 'package:octattoo_app_mvp/core/services/firebase/authentication/authentication_repository.dart';

class SignInScreen extends ConsumerWidget {
  SignInScreen({super.key});

  final GlobalKey<FormState> _key = GlobalKey();
  final _emailKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  key: _emailKey,
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                gapH20,
                TextFormField(
                  key: _passwordKey,
                  controller: _password,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  onFieldSubmitted: (_) {
                    if (_key.currentState!.validate()) {
                      ref.watch(authRepositoryProvider).signInWithEmailAndPassword(_email.text, _password.text, context,
                      );
                    }
                  },
                ),
                gapH20,
                ElevatedButton(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      ref.watch(authRepositoryProvider).signInWithEmailAndPassword(_email.text, _password.text, context,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text('Sign In'),
                ),
                gapH8,
                TextButton(
                  onPressed: () {
                    context.pushNamed('forgotPassword');
                  },
                  child: const Text('Forgot Password?'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
