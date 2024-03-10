import 'package:go_router/go_router.dart';
import 'package:octattoo_app/presentation/screens/login_register/login_register_screen.dart';
import 'package:octattoo_app/presentation/screens/login_register/forgot_password_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'login',
        builder: (context, state) => const LoginRegisterScreen(),
        routes: [
          GoRoute(
            path: 'forgotPassword',
            name: 'forgotPassword',
            builder: (context, state) => const ForgotPasswordScreen(),
          ),
          // Define other nested routes if needed
        ],
      ),
      // ... other top-level routes
    ],
  );
}
