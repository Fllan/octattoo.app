import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/src/features/onboarding/domain/save_onboarding_info_use_case.dart';
import 'package:octattoo_app/src/features/onboarding/domain/submit_onboarding_info_use_case.dart';
import 'package:octattoo_app/src/features/onboarding/domain/user_onboarding_repository.dart';
import 'package:octattoo_app/src/features/onboarding/domain/user_onboarding_repository_impl.dart';
import 'package:octattoo_app/src/features/onboarding/data/local_data_source.dart';
import 'package:octattoo_app/src/features/onboarding/data/firebase_data_source.dart';

// Assuming you have the providers for your data sources
final localDataSourceProvider = Provider<LocalDataSource>((ref) {
  return LocalDataSource();
});

final firebaseDataSourceProvider = Provider<FirebaseDataSource>((ref) {
  return FirebaseDataSource();
});

final userOnboardingRepositoryProvider = Provider<UserOnboardingRepository>((ref) {
  final localDataSource = ref.read(localDataSourceProvider);
  final firebaseDataSource = ref.read(firebaseDataSourceProvider);
  return UserOnboardingRepositoryImpl(localDataSource: localDataSource, firebaseDataSource: firebaseDataSource);
});

// Your existing providers for use cases
final saveOnboardingInfoUseCaseProvider = Provider<SaveOnboardingInfoUseCase>((ref) {
  final repository = ref.read(userOnboardingRepositoryProvider);
  return SaveOnboardingInfo(repository);
});

final submitOnboardingInfoUseCaseProvider = Provider<SubmitOnboardingInfoUseCase>((ref) {
  final repository = ref.read(userOnboardingRepositoryProvider);
  return SubmitOnboardingInfo(repository);
});
