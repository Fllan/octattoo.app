/// Enum representing the keys used in shared preferences.
/// 
/// Add more keys as needed.
enum SharedPreferencesKey {
  languageCode,
  themeMode,
  publicProfile,
  tattooArtist,
  authUserId,
  // Add more keys here as needed
}

/// Extension on [SharedPreferencesKey] to get the string value of each key.
/// 
/// This is used when interacting with the shared preferences API, which requires string keys.
/// 
/// Throws an [Exception] if there is no string value for a given key.
extension SharedPreferencesKeyExtension on SharedPreferencesKey {
  static const Map<SharedPreferencesKey, String> _values = {
    SharedPreferencesKey.languageCode: 'language_code',
    SharedPreferencesKey.themeMode: 'theme_mode',
    SharedPreferencesKey.publicProfile: 'public_profile',
    SharedPreferencesKey.tattooArtist: 'tattoo_artist',
    SharedPreferencesKey.authUserId: 'auth_user_id',
    // Add more keys here as needed
  };

  String get value {
    if (_values.containsKey(this)) {
      return _values[this]!;
    } else {
      throw Exception('Invalid SharedPreferencesKey: $this');
    }
  }
}