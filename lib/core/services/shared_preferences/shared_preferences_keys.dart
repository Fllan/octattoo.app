enum SharedPreferencesKey {
  languageCode,
  themeMode,
  publicProfile,
  userToken,
  notificationEnabled,
  // Add more keys here as needed
}

extension SharedPreferencesKeyExtension on SharedPreferencesKey {
  String get value {
    switch (this) {
      case SharedPreferencesKey.languageCode:
        return 'language_code';
      case SharedPreferencesKey.themeMode:
        return 'theme_mode';
      case SharedPreferencesKey.publicProfile:
        return 'public_profile';
      case SharedPreferencesKey.userToken:
        return 'user_token';
      case SharedPreferencesKey.notificationEnabled:
        return 'notification_enabled';
      default:
        throw Exception('Invalid SharedPreferencesKey: $this');
    }
  }
}