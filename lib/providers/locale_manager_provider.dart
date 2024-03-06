import 'package:flutter_riverpod/flutter_riverpod.dart' show ChangeNotifierProvider;
import 'package:octattoo_app/services/locale_manager.dart';

final localeManagerProvider = ChangeNotifierProvider<LocaleManager>((ref) {
  return LocaleManager();
});