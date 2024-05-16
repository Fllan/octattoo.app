enum SharedPreferencesKey {
  languageCode,
  themeMode,
  publicProfile,
  tattooArtist,
  authUserId,
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
      case SharedPreferencesKey.tattooArtist:
        return 'tattoo_artist';
      case SharedPreferencesKey.authUserId:
        return 'auth_user_id';
      default:
        throw Exception('Invalid SharedPreferencesKey: $this');
    }
  }
}