import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/src/onboarding/presentation/controllers/step_2_controller.dart';

class AvailabilitiesForm extends ConsumerWidget {
  const AvailabilitiesForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final step2Controller = ref.read(step2ControllerProvider.notifier);
    final state = ref.watch(step2ControllerProvider);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      WeekDayLine(
        day: 'Monday'.hardcoded,
        controller: state.isMondaySelected,
        onChanged: (_) => step2Controller.toggleMonday(),
      ),
    ]);
  }
}

class WeekDayLine extends StatelessWidget {
  const WeekDayLine({
    super.key,
    required this.day,
    required this.controller,
    required this.onChanged,
  });

  final String day;
  final bool controller;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      child: Row(
        children: [
          Expanded(
            child: SwitchListTile(
              value: controller,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(day),
              onChanged: onChanged,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.copy),
          ),
        ],
      ),
    );
  }
}
