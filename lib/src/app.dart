//import 'package:accessibility_tools/accessibility_tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/router/router.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      // builder: (context, child) {
      //   // * Add AccessibilityTools to the widget tree.
      //   // * The tools are available only in debug mode
      //   return AccessibilityTools(
      //     enableButtonsDrag: true,
      //     checkFontOverflows: true,
      //     checkImageLabels: true,
      //     buttonsAlignment: ButtonsAlignment.bottomRight,
      //     child: child,
      //   );
      // },
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(colorScheme: const ColorScheme.light()),
      darkTheme: ThemeData.from(colorScheme: const ColorScheme.dark()),
    );
  }
}
