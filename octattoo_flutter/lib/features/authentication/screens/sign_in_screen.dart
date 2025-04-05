import 'package:flutter/material.dart';
import 'package:octattoo_flutter/features/authentication/components/sign_in_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign in")),
      body: SingleChildScrollView(child: SignInForm()),
    );
  }
}
