import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app_mvp/core/constants/gaps.dart';
import 'package:octattoo_app_mvp/core/services/firebase/authentication/authentication_repository.dart';
import 'package:octattoo_app_mvp/src/shared/form_validators.dart';

class RegisterScreen extends ConsumerWidget {
  RegisterScreen({super.key});

  final GlobalKey<FormState> _key = GlobalKey();
  final _emailKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  final _confirmedPasswordKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmedPassword = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                    'You can discover the app anonymously and decide later to create an account',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center),
                gapH20,
                ElevatedButton(
                  onPressed: () {
                    // Implement Start as Guest logic
                    ref.read(authRepositoryProvider).signInAnonymously();
                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text('Start as Guest'),
                ),
                gapH20,
                const Divider(),
                gapH12,
                Form(
                  key: _key,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Text('Or sign up with your email:', style: TextStyle(fontSize: 16)),
                        gapH20,
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          key: _emailKey,
                          controller: _email,
                          autocorrect: true,
                          enableSuggestions: true,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                          validator: emailValidator,
                        ),
                        gapH20,
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          key: _passwordKey,
                          controller: _password,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                          ),
                          obscureText: true,
                          validator: passwordValidator,
                        ),
                        gapH20,
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          key: _confirmedPasswordKey,
                          controller: _confirmedPassword,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: const InputDecoration(
                            labelText: 'Confirm Password',
                            border: OutlineInputBorder(),
                          ),
                          obscureText: true,
                          validator: confirmedPasswordValidator,
                        ),
                        gapH20,
                        ElevatedButton(
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              if (_password.text == _confirmedPassword.text) {
                                ref.watch(authRepositoryProvider).createUserWithEmailAndPassword(_email.text, _password.text, context);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text('Passwords do not match'),
                                ));
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text('Sign Up'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
