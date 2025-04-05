import 'package:flutter/material.dart';
import 'package:octattoo_flutter/features/authentication/components/register_with_email_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: SingleChildScrollView(child: RegisterForm()),
    );
  }
}
