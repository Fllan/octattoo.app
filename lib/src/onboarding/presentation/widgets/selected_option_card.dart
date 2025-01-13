import 'package:flutter/material.dart';
import 'package:octattoo_app/core/constants/gaps.dart';
import 'package:octattoo_app/src/shared/widgets/material_text.dart';

class SelectedOptionCard extends StatelessWidget {
  const SelectedOptionCard({
    super.key,
    this.onPressed,
    required this.iconData,
    required this.title,
    required this.hasSubTitle,
    this.subTitle,
  });
  final void Function()? onPressed;
  final IconData iconData;
  final String title;
  final bool hasSubTitle;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(iconData),
            gapW20,
            hasSubTitle
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MaterialText.labelLarge(title, context),
                      MaterialText.labelMedium(subTitle!, context),
                    ],
                  )
                : MaterialText.labelLarge(title, context),
            gapW24,
            IconButton(
              onPressed: onPressed,
              icon: Icon(Icons.cancel),
            ),
          ],
        ),
      ),
    );
  }
}
