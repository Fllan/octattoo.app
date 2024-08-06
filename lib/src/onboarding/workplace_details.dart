import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app_mvp/core/models/workplace.dart';
import 'package:octattoo_app_mvp/core/services/firebase/firestore/providers/workplaces_repository.dart';
import 'package:octattoo_app_mvp/core/utils/l10n/l10n_extensions.dart';

class WorkplaceDetailsScreen extends ConsumerStatefulWidget {
  final String workplaceId;
  const WorkplaceDetailsScreen({super.key, required this.workplaceId});

  @override
  ConsumerState<WorkplaceDetailsScreen> createState() =>
      _WorkplaceDetailsScreenState();
}

class _WorkplaceDetailsScreenState
    extends ConsumerState<WorkplaceDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final workplaceId = widget.workplaceId;
    final workplace = ref.watch(workplacesRepositoryProvider).read(workplaceId);
    return FutureBuilder<Workplace?>(
      future: workplace,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        final workplace = snapshot.data;
        if (workplace == null) {
          return const Center(child: Text('Workplace not found'));
        }
        return Column(
          children: [
            Text('Workplace name'.hardcoded,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: Theme.of(context).colorScheme.onSurface)),
          ],
        );
      },
    );
  }
}
