import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/models/public_profile.dart';
import 'package:octattoo_app/core/services/shared_preferences/shared_preferences_keys.dart';
import 'package:octattoo_app/core/services/shared_preferences/shared_preferences_provider.dart';
import 'package:octattoo_app/core/utils/logger.dart';
import 'package:octattoo_app/src/features/onboarding/domain/repositories/public_profile_repository.dart';

abstract class LocalPublicProfileRepository implements PublicProfileRepository {
  LocalPublicProfileRepository({required this.ref});
  final Ref ref;

  @override
  Future<void> savePublicProfile(PublicProfile publicProfile) async {
    try {
      final pref = await ref.read(sharedPreferencesFutureProvider.future);
      var publicProfileKey = SharedPreferencesKey.publicProfile.toString();
      await pref.setString(publicProfileKey, publicProfile.toJson().toString());
      logger.d("Saved public profile locally: ${publicProfile.toJson()}");
    } on Exception catch (e) {
      logger.e(e);
    }
  }

  @override
  Future<void> uploadPublicProfile(PublicProfile publicProfile) async {
    try {
      //TODO: Implement uploadPublicProfile
    } on Exception catch (e) {
      logger.e(e);
    }
  }}
