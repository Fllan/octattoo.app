import 'package:octattoo_app/src/features/onboarding/domain/user_onboarding_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LocalDataSource {
  static const String _onboardingInfoKey = 'onboardingInfo';

  Future<void> saveOnboardingInfoLocally(UserOnboardingInfo info) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = json.encode(info.toJson());
    await prefs.setString(_onboardingInfoKey, jsonString);
  }

  Future<AppUserOnboardingInfo?> getOnboardingInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(_onboardingInfoKey);
    if (jsonString == null) return null;
    return UserOnboardingInfo.fromJson(json.decode(jsonString));
  }
}
