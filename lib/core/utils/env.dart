import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> setupEnv() async {
  await dotenv.load();
}