import 'package:flutter/material.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';

class AvailabilitiesWeekDay extends StatelessWidget {
  const AvailabilitiesWeekDay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WeekDayLine(day: 'Monday'.hardcoded),
      ],
    );
  }
}

class WeekDayLine extends StatelessWidget {
  const WeekDayLine({super.key, required this.day});

  final String day;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      child: Row(
        children: [
          Expanded(
            child: SwitchListTile(
              value: true,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(day),
              onChanged: (value) {},
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.copy),
          ),
        ],
      ),
    );
  }
}
