import 'package:octattoo_app/about/about.dart';
import 'package:octattoo_app/home/home.dart';
import 'package:octattoo_app/login/login.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/about': (context) => const AboutScreen(),
  '/login': (context) => const LoginScreen(),
};