import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// An extension on [BuildContext] that provides easy access to localized strings.
extension LocalizedBuildContext on BuildContext {
  /// Returns the [AppLocalizations] instance for the current context.
  AppLocalizations get loc => AppLocalizations.of(this)!;
}

/// An extension on [String] that can be used to search all the hardcoded strings
/// in the code (useful to identify strings that need to be localized).
extension StringHardcoded on String {
  /// Returns the string itself.
  ///
  /// This getter can be used to easily search for hardcoded strings in the code.
  String get hardcoded => this;
}
