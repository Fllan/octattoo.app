/// SharedPreferencesKeys is an enum that contains all the keys used to save and retrieve data from SharedPreferences
///
/// This enum is used to ensure that the keys used to save and retrieve data from SharedPreferences are consistent
/// throughout the application. It provides a single source of truth for all the keys used in the application.
///
/// Example:
/// ```dart
/// SharedPreferencesKeys.locale
/// SharedPreferencesKeys.theme
/// SharedPreferencesKeys.onboardingStep
/// ```
enum SharedPreferencesKeys {
  locale,
  theme,
  // 0:Onboarding, 1:Artist Profile, 2:Workplace Type, 3:Workplace Add
  onboardingStep,
  onboardingArtistName,
  onboardingShowRealNames,
  onboardingShowPronoun,
  onboardingFirstname,
  onboardingLastname,
  onboardingPronoun,
  onboardingWorkplaceType,
}
