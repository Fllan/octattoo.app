import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:octattoo_app/core/constants/gaps.dart';
import 'package:octattoo_app/core/constants/workplace_types.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/src/onboarding/presentation/controllers/step_2_controller.dart';
import 'package:octattoo_app/src/shared/widgets/buttons/custom_buttons.dart';
import 'package:octattoo_app/src/shared/widgets/material_text.dart';

class SelectWorkplaceType extends StatelessWidget {
  const SelectWorkplaceType({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MaterialText.labelLarge(
              'Add your first workplace by selecting a type. You can add other workplaces later.'
                  .hardcoded,
              context),
          gapH32,
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: WorkplaceTypeCard(
                    title: 'Guest'.hardcoded,
                    description:
                        'When you tattoo for a period of time in a specific workplace'
                            .hardcoded,
                    icon: Icons.work_history_outlined,
                    workplaceType: WorkplaceTypes.guest,
                  ),
                ),
                gapW16,
                Expanded(
                  child: WorkplaceTypeCard(
                    title: 'Permanent'.hardcoded,
                    description: 'Where you tattoo most of your time'.hardcoded,
                    icon: Icons.storefront_outlined,
                    workplaceType: WorkplaceTypes.permanent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WorkplaceTypeCard extends ConsumerWidget {
  const WorkplaceTypeCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.workplaceType,
  });

  final String title;
  final String description;
  final IconData icon;
  final WorkplaceTypes workplaceType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final step2Notifier = ref.watch(step2ControllerProvider.notifier);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                children: [
                  MaterialText.titleMedium(title, context),
                  gapH24,
                  Icon(
                    icon,
                    size: 68,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  gapH24,
                  MaterialText.bodyMedium(description, context),
                  gapH24,
                ],
              ),
              SecondaryButton(
                label: Text('New $title'.hardcoded),
                onPressed: () => step2Notifier.setWorkplaceType(workplaceType),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
