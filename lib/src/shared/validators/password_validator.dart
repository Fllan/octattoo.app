import 'package:octattoo_app/core/localization/l10n_extensions.dart';

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password'.hardcoded;
  } else if (value.length < 6) {
    return 'Password must be at least 6 characters'.hardcoded;
  }
  return null;
}
