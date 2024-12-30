import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:octattoo_app/core/constants/gaps.dart';
import 'package:octattoo_app/src/onboarding/presentation/controllers/step_2_controller.dart';
import 'package:octattoo_app/src/shared/widgets/buttons/custom_buttons.dart';

class SetPermanentAvailabilitiesForm extends ConsumerWidget {
  const SetPermanentAvailabilitiesForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text('SetPermanentAvailabilitiesForm'),
        gapH32,
        //! for development only
        const Divider(),
        gapH64,
        TertiaryButton(
          label: const Text('Reset type selection'),
          onPressed: () =>
              ref.read(step2ControllerProvider.notifier).setWorkplaceType(null),
        ),
        TertiaryButton(
          label: const Text('Reset workplace selection'),
          onPressed: () =>
              ref.read(step2ControllerProvider.notifier).setWorkplace(null),
        ),
        //! for development only
      ],
    );
  }
}
