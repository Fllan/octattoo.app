import 'package:flutter/material.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/src/shared/widgets/material_text.dart';

class Step1ArtistProfile extends StatelessWidget {
  const Step1ArtistProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MaterialText.labelLarge(
              'Let\'s set the basics of your public artist identity'.hardcoded,
              context),
        ],
      ),
    );
  }
}
