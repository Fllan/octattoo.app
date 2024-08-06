import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app_mvp/core/constants/gaps.dart';
import 'package:octattoo_app_mvp/core/start/app_startup_provider.dart';
import 'package:octattoo_app_mvp/core/utils/l10n/l10n_extensions.dart';

/// A widget that handles the app startup process and displays appropriate UI
/// based on the state of the app initialization.
///
/// This widget uses Riverpod to watch the state of the app startup provider and
/// displays different widgets based on whether the app is still loading, has encountered
/// an error, or has loaded successfully.
///
/// - **onLoaded**: A builder function that provides the widget to display when the app
///   has finished loading successfully.
class AppStartupWidget extends ConsumerWidget {
  const AppStartupWidget({super.key, required this.onLoaded});
  final WidgetBuilder onLoaded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStartupState = ref.watch(appStartupProvider);
    return appStartupState.when(
      data: (_) => onLoaded(context),
      loading: () => const AppStartupLoadingWidget(),
      error: (e, st) => AppStartupErrorWidget(
        message: e.toString(),
        onRetry: () => ref.invalidate(appStartupProvider),
      ),
    );
  }
}

/// A widget that displays a loading indicator during the app startup process.
class AppStartupLoadingWidget extends StatelessWidget {
  const AppStartupLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

/// A widget that displays an error message and a retry button if the app
/// startup process encounters an error.
///
/// - **message**: The error message to display.
/// - **onRetry**: A callback function to retry the app startup process.
class AppStartupErrorWidget extends StatelessWidget {
  const AppStartupErrorWidget(
      {super.key, required this.message, required this.onRetry});
  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, style: Theme.of(context).textTheme.headlineSmall),
            gapH16,
            ElevatedButton(
              onPressed: onRetry,
              child: Text('Retry'.hardcoded),
            ),
          ],
        ),
      ),
    );
  }
}
