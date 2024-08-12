/// Enum representing the supported languages.
enum Language {
  english(flag: '🇺🇸', name: 'English', code: 'en'),
  french(flag: '🇫🇷', name: 'Français', code: 'fr');

  /// Creates a [Language].
  ///
  /// Requires a [flag], a [name], and a [code].
  const Language({required this.flag, required this.name, required this.code});

  /// Emoji flag representing the language.
  final String flag;

  /// Name of the language in the language itself.
  final String name;

  /// ISO 639-1 code of the language.
  final String code;
}
