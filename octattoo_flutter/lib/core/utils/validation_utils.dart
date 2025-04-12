import 'package:octattoo_flutter/core/l10n_extensions.dart';

class ValidationUtils {
  static String? confirmPasswordValidator(
      String? confirmPassword, String originalPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Please confirm your password'.hardcoded;
    } else if (confirmPassword.length >= originalPassword.length &&
        confirmPassword != originalPassword) {
      return 'Passwords do not match'.hardcoded;
    }
    return null;
  }

  static String? default3CharValidator(String? value, String messageEmpty) {
    if (value == null || value.isEmpty) {
      return messageEmpty;
    }
    if (value.length < 3) {
      return 'It must be at least 3 characters long'.hardcoded;
    }
    return null;
  }

  static String? verificationCodeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter the verification code sent by email.".hardcoded;
    }
    if (value.length != 8) {
      return 'Verification code is 8 characters long'.hardcoded;
    }
    return null;
  }

  static String? emailValidator(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';

    final regex = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Please enter your email'.hardcoded;
    }
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email'.hardcoded;
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password'.hardcoded;
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters'.hardcoded;
    }
    return null;
  }
}
