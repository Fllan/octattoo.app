import 'package:octattoo_app_mvp/core/utils/l10n/l10n_extensions.dart';

String? artistNameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your artist name'.hardcoded;
  }
  return null;
}
