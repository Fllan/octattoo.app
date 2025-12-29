import 'package:flutter/material.dart';
import 'package:octattoo_flutter/core/router/routes.dart';
import 'package:octattoo_flutter/src/shared/l10n_extensions.dart';
import 'package:octattoo_flutter/src/shared/material_text.dart';

class ArtistProfileScreen extends StatelessWidget {
  const ArtistProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 12.0),
      children: [
        ListTile(
          leading: Icon(Icons.person),
          title: MaterialText.titleMedium(
            'Public profile'.hardcoded,
            context,
          ),
          subtitle: MaterialText.bodyMedium(
            'Manage your artist identity'.hardcoded,
            context,
          ),
          onTap: () => PublicProfileRoute().go(context),
        ),
        ListTile(
          leading: Icon(Icons.storefront),
          title: MaterialText.titleMedium(
            'Workplace'.hardcoded,
            context,
          ),
          subtitle: MaterialText.bodyMedium(
            'Manage the places where you work'.hardcoded,
            context,
          ),
          onTap: () => MyWorkplacesRoute().go(context),
        ),
      ],
    );
  }
}
