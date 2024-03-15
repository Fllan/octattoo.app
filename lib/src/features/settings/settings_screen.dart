import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/src/common_widgets/app_loader.dart';
import 'package:octattoo_app/src/features/settings/settings_screen_controller.dart';
import 'package:octattoo_app/src/utils/async_value_error.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(settingsScreenControllerProvider,
        (_, state) => state.showAlertDialogOnError(context));
    final state = ref.watch(settingsScreenControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Screen'),
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () =>
                  ref.read(settingsScreenControllerProvider.notifier).logout(),
              child: state.isLoading
                  ? AppLoader.circularProgress()
                  : const Text('Logout'))),
    );
  }
}