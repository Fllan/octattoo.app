import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/src/common_widgets/custom_switch_list_tile.dart';
import 'package:octattoo_app/src/common_widgets/custom_textfield.dart';
import 'package:octattoo_app/src/constants/sizes.dart';
import 'package:octattoo_app/src/features/language/localization.dart';
import 'package:octattoo_app/src/features/onboarding/presentation/controllers/onboarding_artist_name_controller.dart';
import 'package:octattoo_app/src/features/onboarding/presentation/pronoun_switch_notifier.dart';
import 'package:octattoo_app/src/features/onboarding/presentation/names_switch_notifier.dart';
import 'package:octattoo_app/src/features/router/app_router_listenable.dart';

class OnboardingArtistNameScreen extends ConsumerWidget {
  const OnboardingArtistNameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artistName = ref.watch(onboardingArtistNameControllerProvider.select((info) => info.artistName));

    final pronounSwitchValue = ref.watch(pronounSwitchProvider);
    final pronounSwitchNotifier = ref.read(pronounSwitchProvider.notifier);
    final namesSwitchValue = ref.watch(namesSwitchProvider);
    final namesSwitchNotifier = ref.read(namesSwitchProvider.notifier);

    final appRouterListenable = ref.watch(appRouterListenableProvider);

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
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
                controller: TextEditingController(text: artistName),
                onChanged: (value) => ref.read(onboardingArtistNameControllerProvider.notifier).setArtistName(value),
              ),
              gapH16,
              CustomSwitchListTile(
                title: 'I want to specify my pronoun'.hardcoded,
                value: pronounSwitchValue,
                onChanged: (newValue) =>
                    pronounSwitchNotifier.toggleSwitch(newValue),
              ),
              gapH16,
              if (pronounSwitchValue)
                TextField(
                  decoration: InputDecoration(
                    label: Text('Pronoun'.hardcoded),
                    border: const OutlineInputBorder(),
                  ),
                ),
              gapH16,
              CustomSwitchListTile(
                title: 'I want to specify my real name'.hardcoded,
                value: namesSwitchValue,
                onChanged: (newValue) =>
                    namesSwitchNotifier.toggleSwitch(newValue),
              ),
              gapH16,
              if (namesSwitchValue)
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CustomTextField(
                        label: "Firstname".hardcoded,
                        // controller: _firstNameController,
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
                      flex: 3,
                      child: CustomTextField(
                        label: "Lastname".hardcoded,
                        // controller: _lastNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text'.hardcoded;
                          } else if (!RegExp(r"^[\p{Letter}\s\-.']+$",
                                  unicode: true)
                              .hasMatch(value)) {
                            return 'Please enter a valid name'.hardcoded;
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              //
              //  TODO : remove logout button - for dev purpose
              //
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 64, 30, 0),
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
