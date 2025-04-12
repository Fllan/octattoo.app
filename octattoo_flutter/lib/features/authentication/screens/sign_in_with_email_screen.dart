import 'package:flutter/material.dart';
import 'package:octattoo_flutter/core/l10n_extensions.dart';
import 'package:octattoo_flutter/features/authentication/components/sign_in_with_email_form.dart';

class SignInWithEmailScreen extends StatelessWidget {
  const SignInWithEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SignInWithEmailScreen".hardcoded)),
      body: SingleChildScrollView(child: SignInWithEmailForm()),
    );
  }
}
