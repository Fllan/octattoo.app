import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/constants/gaps.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/src/onboarding/presentation/controllers/step_2_controller.dart';
import 'package:octattoo_app/src/shared/widgets/buttons/custom_buttons.dart';
import 'package:octattoo_app/src/shared/widgets/material_text.dart';

class AddWorkplace extends ConsumerWidget {
  const AddWorkplace({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final state = ref.watch(step2ControllerProvider);
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
          gapH16,
          SearchBar(
            controller: step2Controller.searchFieldController,
            autoFocus: true,
            leading: const Icon(Icons.search),
            padding: null,
            hintText: 'Search a workplace'.hardcoded,
          ),
          //TODO: replace column and static content by ListView filtering on searchFiledController
          Column(
            children: [
              ListTile(
                leading: const Icon(Icons.store),
                title: const Text('La Vipère Rose'),
                subtitle: const Text('Lyon - France'),
                trailing: const Icon(Icons.add),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.store),
                title: const Text('La Cygogne piqueuse'),
                subtitle: const Text('Nantes - France'),
                trailing: const Icon(Icons.add),
                onTap: () {},
              ),
            ],
          ),
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
