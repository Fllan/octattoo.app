import 'package:flutter/material.dart';

import 'app_settings_notifier.dart';
import 'app_settings_repository.dart';

/// InheritedNotifier automatically listens to the ChangeNotifier
/// and rebuilds dependents when notifyListeners() is called.
class _AppSettingsInherited extends InheritedNotifier<AppSettingsNotifier> {
  const _AppSettingsInherited({
    required AppSettingsNotifier notifier,
    required super.child,
  }) : super(notifier: notifier);
}

/// Stateful wrapper to properly manage the notifier lifecycle.
/// This solves the "controllers created but never disposed" problem.
class AppSettingsProvider extends StatefulWidget {
  const AppSettingsProvider({
    super.key,
    required this.repository,
    required this.child,
  });

  final AppSettingsRepository repository;
  final Widget child;

  /// Access the notifier from anywhere in the widget tree.
  /// Uses dependOnInheritedWidgetOfExactType for automatic rebuilds.
  static AppSettingsNotifier of(BuildContext context) {
    final inherited =
        context.dependOnInheritedWidgetOfExactType<_AppSettingsInherited>();
    assert(
      inherited?.notifier != null,
      'No AppSettingsProvider found in context',
    );
    return inherited!.notifier!;
  }

  /// Access without creating a dependency (for callbacks/event handlers).
  /// Widget won't rebuild when settings change.
  static AppSettingsNotifier read(BuildContext context) {
    final inherited =
        context.getInheritedWidgetOfExactType<_AppSettingsInherited>();
    assert(
      inherited?.notifier != null,
      'No AppSettingsProvider found in context',
    );
    return inherited!.notifier!;
  }

  @override
  State<AppSettingsProvider> createState() => _AppSettingsProviderState();
}

class _AppSettingsProviderState extends State<AppSettingsProvider> {
  late final AppSettingsNotifier _notifier;

  @override
  void initState() {
    super.initState();
    _notifier = AppSettingsNotifier(widget.repository);
    // Initialize in background - uses defaults immediately, updates when ready
    _notifier.initialize();
  }

  @override
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _AppSettingsInherited(
      notifier: _notifier,
      child: widget.child,
    );
  }
}
