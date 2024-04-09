enum Language {
  english(flag: '🇺🇸', name: 'English', code: 'en'),
  french(flag: '🇫🇷', name: 'Français', code: 'fr');

  const Language({required this.flag, required this.name, required this.code});

  final String flag;
  final String name;
  final String code;
}