/// Enum representing the supported languages.
enum Language {
  english(name: 'English', code: 'en'),
  french(name: 'Français', code: 'fr'),
  arabic(name: 'اَلْعَرَبِيَّةُ', code: 'ar');

  /// Creates a [Language].
  ///
  /// Requires a [name] and a [code].
  const Language({required this.name, required this.code});

  /// Name of the language in the language itself.
  final String name;

  /// ISO 639-1 code of the language.
  final String code;
}
