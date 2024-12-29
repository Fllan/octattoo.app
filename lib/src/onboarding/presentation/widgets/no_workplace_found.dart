import 'package:flutter/material.dart';
import 'package:octattoo_app/core/constants/breakpoints.dart';
import 'package:octattoo_app/core/constants/gaps.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/src/onboarding/presentation/widgets/new_workplace_form.dart';
import 'package:octattoo_app/src/shared/widgets/buttons/primary_button.dart';
import 'package:octattoo_app/src/shared/widgets/material_text.dart';

class NoWorkplaceFound extends StatelessWidget {
  const NoWorkplaceFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MaterialText.bodyMedium(
            'No workplaces found.'.hardcoded,
            context,
          ),
          gapH16,
          PrimaryButton(
            label: Text('Add a new workplace'.hardcoded),
            icon: const Icon(Icons.add_business),
            onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) => adaptiveDialog(context),
            ),
          ),
        ],
      ),
    );
  }
}

Dialog adaptiveDialog(BuildContext context) {
  AdaptiveScaffoldType currentScaffold =
      BreakpointsExtension.getScaffold(context);
  if (currentScaffold == AdaptiveScaffoldType.appBar ||
      currentScaffold == AdaptiveScaffoldType.compactAppBar) {
    return Dialog.fullscreen(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: NewWorkplaceForm(),
      ),
    );
  } else {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: NewWorkplaceForm(),
      ),
    );
  }
}
