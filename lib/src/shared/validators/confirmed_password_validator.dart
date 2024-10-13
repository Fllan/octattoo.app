import 'package:octattoo_app/core/localization/l10n_extensions.dart';

String? confirmPasswordValidator(
    String? confirmPassword, String originalPassword) {
  if (confirmPassword == null || confirmPassword.isEmpty) {
    return 'Please confirm your password'.hardcoded;
  } else if (confirmPassword.length >= originalPassword.length &&
      confirmPassword != originalPassword) {
    return 'Passwords do not match'.hardcoded;
  }
  return null;
}
