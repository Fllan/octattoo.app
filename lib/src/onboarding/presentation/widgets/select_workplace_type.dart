import 'package:flutter/material.dart';
import 'package:octattoo_app/core/constants/gaps.dart';
import 'package:octattoo_app/core/constants/workplace_types.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/src/onboarding/presentation/widgets/workplace_type_card.dart';
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
              'We consider two types of workplaces. Pick the one that fits better.'
                  .hardcoded,
              context),
          gapH32,
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: WorkplaceTypeCard(
                    title: 'Permanent'.hardcoded,
                    description: 'Where you tattoo most of your time'.hardcoded,
                    icon: Icons.storefront_outlined,
                    workplaceType: WorkplaceTypes.permanent,
                  ),
                ),
                gapW16,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
