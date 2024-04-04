import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/src/common_widgets/custom_switch_list_tile.dart';
import 'package:octattoo_app/src/common_widgets/custom_textfield.dart';
import 'package:octattoo_app/src/constants/sizes.dart';
import 'package:octattoo_app/src/features/language/localization.dart';
import 'package:octattoo_app/src/features/onboarding/presentation/pronoun_switch_notifier.dart';
import 'package:octattoo_app/src/features/router/app_router_listenable.dart';

class OnboardingArtistNameScreen extends ConsumerStatefulWidget {
  const OnboardingArtistNameScreen({super.key});

  @override
  ConsumerState<OnboardingArtistNameScreen> createState() => _OnboardingArtistNameScreenState();
}

class _OnboardingArtistNameScreenState extends ConsumerState<OnboardingArtistNameScreen> {
  final TextEditingController _artistNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final switchValue = ref.watch(pronounSwitchProvider);
    final switchNotifier = ref.read(pronounSwitchProvider.notifier);
    final appRouterListenable = ref.watch(appRouterListenableProvider);

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              gapH64,
              Text(
                'Artist Profile'.hardcoded,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              gapH16,
              Text(
                "First let's set your public artist identity".hardcoded,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              gapH32,
              CustomTextField(
                label: "Artist name".hardcoded,
                controller: _artistNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text'.hardcoded;
                  }
                  return null;
                },
              ),
              gapH16,
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: "Firstname".hardcoded,
                      controller: _firstNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text'.hardcoded;
                        } else if (!RegExp(r'', unicode: true)
                            .hasMatch(value)) {
                          return 'Please enter a valid name'.hardcoded;
                        }
                        return null;
                      },
                    ),
                  ),
                  gapW8,
                  Expanded(
                    child: CustomTextField(
                      label: "Lastname".hardcoded,
                      controller: _lastNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text'.hardcoded;
                        } else if (!RegExp(r"^[\p{Letter}\s\-.']+$", unicode: true)
                            .hasMatch(value)) {
                          return 'Please enter a valid name'.hardcoded;
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              gapH16,
              CustomSwitchListTile(
                title: 'I want to specify my pronoun'.hardcoded,
                value: switchValue,
                onChanged: (newValue) => switchNotifier.toggleSwitch(newValue),
              ),
              gapH16,
              if (switchValue)
                TextField(
                  decoration: InputDecoration(
                    label: Text('Pronoun'.hardcoded),
                    border: const OutlineInputBorder(),
                  ),
                ),
              //
              //  TODO : remove logout button - for dev purpose
              //
              gapH64,
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: ElevatedButton(
                  child: Text(context.loc.signOutAction),
                  onPressed: () => appRouterListenable.signOut(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
