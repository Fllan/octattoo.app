import 'package:flutter/material.dart';
import 'package:octattoo_flutter/src/shared/gaps.dart';
import 'package:octattoo_flutter/src/shared/l10n_extensions.dart';
import 'package:octattoo_flutter/src/shared/material_text.dart';

class IdentityScreen extends StatelessWidget {
  const IdentityScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            gapH20,
            Row(
              mainAxisSize: .max,
              mainAxisAlignment: .spaceEvenly,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        '/assets/artist_profile.jpg',
                      ),
                    ),
                    gapH8,
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Change avatar'.hardcoded),
                    ),
                  ],
                ),
                Column(
                  children: [
                    // Banner image placeholder
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        image: DecorationImage(
                          image: NetworkImage(
                            '/assets/artist_banner.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    gapH8,
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Change banner'.hardcoded),
                    ),
                  ],
                ),
              ],
            ),
            gapH20,
            MaterialText.titleSmall('Artist name'.hardcoded, context),
            gapH8,
            TextField(
              decoration: InputDecoration(
                labelText: 'Your unique artist name'.hardcoded,
                border: OutlineInputBorder(),
                floatingLabelBehavior: .never,
              ),
            ),
            gapH20,
            MaterialText.titleSmall('Bio'.hardcoded, context),
            gapH8,
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'A short bio about you'.hardcoded,
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
                floatingLabelBehavior: .never,
              ),
            ),
            gapH20,
            Row(
              mainAxisAlignment: .end,
              children: [
                FilledButton(
                  onPressed: () {},
                  child: MaterialText.labelLarge('Save'.hardcoded, context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
