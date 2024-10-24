import 'package:octattoo_app/core/localization/l10n_extensions.dart';

String? default3CharValidator(String? value, String messageEmpty) {
  if (value == null || value.isEmpty) {
    return messageEmpty;
  }
  if (value.length < 3) {
    return 'It must be at least 3 characters long'.hardcoded;
  }
  return null;
}
