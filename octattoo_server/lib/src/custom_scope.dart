import 'package:serverpod/serverpod.dart';

class CustomScope extends Scope {
  const CustomScope(String super.name);

  static const tattooArtist = CustomScope('tattooArtist');
  static const customer = CustomScope('customer');
}
