import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:octattoo_app_mvp/core/constants/gaps.dart';
import 'package:octattoo_app_mvp/core/router/routes.dart';
import 'package:octattoo_app_mvp/core/utils/l10n/l10n_extensions.dart';
import 'package:octattoo_app_mvp/core/utils/logger.dart';
import 'package:octattoo_app_mvp/core/utils/shared_preferences.dart';

class ArtistProfileScreen extends StatefulWidget {
  const ArtistProfileScreen({super.key});

  @override
  State<ArtistProfileScreen> createState() => _ArtistProfileScreenState();
}

class _ArtistProfileScreenState extends State<ArtistProfileScreen> {
  bool _showRealNames = false;
  bool _showPronoun = false;
  final _formKey = GlobalKey<FormState>();
  final _artistNameController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _pronounController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var isFormValid = _formKey.currentState?.validate();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        onChanged: () => setState(() {}),
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Artist Profile'.hardcoded,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      )),
              gapH16,
              Text("Let's set your public artist identity.".hardcoded,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      )),
              gapH32,
              TextFormField(
                controller: _artistNameController,
                decoration: InputDecoration(
                  labelText: 'Your artist name'.hardcoded,
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your artist name'.hardcoded;
                  }
                  return null;
                },
              ),
              gapH20,
              SwitchListTile(
                title: Text('I want to show my real names'.hardcoded),
                value: _showRealNames,
                onChanged: (value) {
                  setState(() {
                    _showRealNames = value;
                  });
                },
              ),
              if (_showRealNames) ...[
                TextFormField(
                  controller: _firstnameController,
                  decoration: InputDecoration(
                    labelText: 'Firstname'.hardcoded,
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your firstname'.hardcoded;
                    }
                    return null;
                  },
                ),
                gapH12,
                TextFormField(
                  controller: _lastnameController,
                  decoration: InputDecoration(
                    labelText: 'Lastname'.hardcoded,
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your lastname'.hardcoded;
                    }
                    return null;
                  },
                ),
              ],
              gapH20,
              SwitchListTile(
                title: Text('I want to show my pronoun'.hardcoded),
                enableFeedback: true,
                value: _showPronoun,
                onChanged: (value) {
                  setState(() {
                    _showPronoun = value;
                  });
                },
              ),
              if (_showPronoun) ...[
                TextFormField(
                  controller: _pronounController,
                  decoration: InputDecoration(
                    labelText: 'Pronoun'.hardcoded,
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your pronoun'.hardcoded;
                    }
                    return null;
                  },
                ),
              ],
              gapH32,
              Row(
                children: [
                  gapW16,
                  if (isFormValid ?? false)
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          _saveArtistProfile();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.arrow_forward),
                            gapW4,
                            Text('Continue'.hardcoded),
                          ],
                        ),
                      ),
                    ),
                  if (isFormValid == null || !isFormValid)
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: null,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.arrow_forward),
                            gapW4,
                            Text('Continue'.hardcoded),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveArtistProfile() async {
    if (!_validateForm()) return;

    try {
      await _saveProfileData();
      _navigateToNextScreen();
    } catch (e) {
      _showErrorMessage();
    }
  }

  bool _validateForm() {
    return _formKey.currentState?.validate() ?? false;
  }

  Future<void> _saveProfileData() async {
    final prefs = SharedPreferencesService.instance;
    await prefs.saveString(
        SharedPreferencesKeys.onboardingArtistName, _artistNameController.text);
    await prefs.saveBool(
        SharedPreferencesKeys.onboardingShowRealNames, _showRealNames);
    await prefs.saveBool(
        SharedPreferencesKeys.onboardingShowPronoun, _showPronoun);

    if (_showRealNames) {
      await prefs.saveString(
          SharedPreferencesKeys.onboardingFirstname, _firstnameController.text);
      await prefs.saveString(
          SharedPreferencesKeys.onboardingLastname, _lastnameController.text);
    }

    if (_showPronoun) {
      await prefs.saveString(
          SharedPreferencesKeys.onboardingPronoun, _pronounController.text);
    }

    // Construct debug message
    String debugMessage = 'Saved profile data: '
        'Artist Name: ${_artistNameController.text}, '
        'Show Real Names: $_showRealNames, '
        'Show Pronoun: $_showPronoun';
    if (_showRealNames) {
      debugMessage +=
          ', Firstname: ${_firstnameController.text}, Lastname: ${_lastnameController.text}';
    }
    if (_showPronoun) {
      debugMessage += ', Pronoun: ${_pronounController.text}';
    }
    // Log the debug message
    logger.d(debugMessage);
  }

  void _navigateToNextScreen() {
    GoRouter.of(context).pushNamed(OnboardingSubRoutes.workplace.name);
  }

  void _showErrorMessage() {
    // TODO : Implement error handling UI feedback, e.g., SnackBar, AlertDialog
  }
}