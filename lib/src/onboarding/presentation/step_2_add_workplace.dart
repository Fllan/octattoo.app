import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:octattoo_app/src/onboarding/presentation/controllers/step_2_controller.dart';
import 'package:octattoo_app/src/onboarding/presentation/widgets/add_workplace.dart';
import 'package:octattoo_app/src/onboarding/presentation/widgets/select_workplace_type.dart';

class Step2AddWorkplace extends ConsumerWidget {
  const Step2AddWorkplace({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(step2ControllerProvider);
    // final step2Controller = ref.read(step2ControllerProvider.notifier);
    final typeSelected = state.workplaceType;

    if (typeSelected == null) {
      return const SelectWorkplaceType();
    } else {
      return const AddWorkplace();
    }
  }
}
