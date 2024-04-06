import 'package:octattoo_app/src/features/onboarding/data/firebase_data_source.dart';
import 'package:octattoo_app/src/features/onboarding/data/local_data_source.dart';
import 'package:octattoo_app/src/features/onboarding/domain/user_onboarding_repository.dart';
import 'package:octattoo_app/src/features/onboarding/domain/user_onboarding_info.dart';

class UserOnboardingRepositoryImpl implements UserOnboardingRepository {
  final LocalDataSource localDataSource;
  final FirebaseDataSource firebaseDataSource;

  UserOnboardingRepositoryImpl({required this.localDataSource, required this.firebaseDataSource});

  @override
  Future<void> saveOnboardingInfoLocally(UserOnboardingInfo info) async {
    // Use LocalDataSource to save data using SharedPreferences
  }

  @override
  Future<void> submitOnboardingInfoToFirebase() async {
    // Retrieve locally stored data and submit to Firebase
  }
}