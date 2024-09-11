import 'package:flutter/material.dart';

class ListDetailLayout extends StatelessWidget {
  final Widget listPane;
  final Widget detailPane;
  const ListDetailLayout({
    super.key,
    required this.listPane,
    required this.detailPane,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: listPane,
        ),
        const VerticalDivider(
          width: 24.0,
        ),
        Expanded(
          child: detailPane,
        ),
      ],
    );
  }
}
