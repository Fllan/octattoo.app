import 'package:flutter/material.dart';
import 'package:octattoo_app/about/about.dart';
import 'package:octattoo_app/login/login.dart';
import 'package:octattoo_app/services/auth.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,      
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('loading');
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('error'),
          );
        } else if (snapshot.hasData) {
          return const AboutScreen();
        } else {
          return const LoginScreen();
        }
      }
    );
  }
}