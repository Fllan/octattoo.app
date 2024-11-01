import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/constants/gaps.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/src/onboarding/presentation/controllers/step_2_controller.dart';
import 'package:octattoo_app/src/onboarding/presentation/widgets/workplaces_list.dart';
import 'package:octattoo_app/src/shared/widgets/buttons/custom_buttons.dart';
import 'package:octattoo_app/src/shared/widgets/material_text.dart';

class AddWorkplace extends ConsumerWidget {
  const AddWorkplace({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final step2Controller = ref.read(step2ControllerProvider.notifier);
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MaterialText.labelLarge(
              'Add to your profile an existing workplace or create a new one.'
                  .hardcoded,
              context),
          gapH24,
          SearchBar(
            onChanged: (_) => step2Controller.updateSearchTerm(),
            controller: step2Controller.searchFieldController,
            autoFocus: true,
            leading: const Icon(Icons.search),
            padding: null,
            hintText: 'Search a workplace'.hardcoded,
          ),
          gapH16,
          //! dev in progress
          const SizedBox(
            height: 220,
            child: WorkplacesList(),
          ),
          //! dev in progress
          gapH32,
          //! for development only
          const Divider(),
          gapH64,
          TertiaryButton(
            label: const Text('Reset type selection'),
            onPressed: () => ref
                .read(step2ControllerProvider.notifier)
                .setWorkplaceType(null),
          ),
          //! for development only
        ],
      ),
    );
  }
}
