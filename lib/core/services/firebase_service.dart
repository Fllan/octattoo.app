import 'package:octattoo_app/core/services/firebase/firebase_app_check_service.dart';
import 'package:octattoo_app/core/services/firebase/firebase_init_service.dart';

class FirebaseService {
  static Future<void> initializeAll() async {
    await FirebaseInitService.initializeFirebase();
    await FirebaseAppCheckService.activateAppCheck();
  }
  // Any other Firebase related initializations go here
}
