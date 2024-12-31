import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:octattoo_app/core/constants/workplace_types.dart';
import 'package:octattoo_app/src/onboarding/presentation/controllers/step_2_controller.dart';
import 'package:octattoo_app/src/onboarding/presentation/widgets/add_workplace.dart';
import 'package:octattoo_app/src/onboarding/presentation/widgets/select_workplace_type.dart';
import 'package:octattoo_app/src/onboarding/presentation/widgets/set_guest_availabilities_form.dart';
import 'package:octattoo_app/src/onboarding/presentation/widgets/set_permanent_availabilities_form.dart';

class Step2AddWorkplace extends ConsumerWidget {
  const Step2AddWorkplace({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(step2ControllerProvider);
    final typeSelected = state.workplaceType;
    final workplaceSelected = state.workplace;

    if (typeSelected == null) {
      return const SelectWorkplaceType();
    } else if (workplaceSelected == null) {
      return const AddWorkplace();
    } else if (typeSelected == WorkplaceTypes.guest) {
      return const SetGuestAvailabilitiesForm();
    } else {
      return const SetPermanentAvailabilitiesForm();
    }
  }
}
