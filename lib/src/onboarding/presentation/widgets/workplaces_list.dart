import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/src/onboarding/data/algolia_workplaces_repository.dart';
import 'package:octattoo_app/src/onboarding/presentation/widgets/no_workplace_found.dart';
import 'package:octattoo_app/src/shared/widgets/material_text.dart';

class WorkplacesList extends ConsumerWidget {
  const WorkplacesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchResults = ref.watch(workplacesSearchResultsProvider);
    final textColor = Theme.of(context).colorScheme.onSurface;
    final highlightColor = Theme.of(context).colorScheme.primary;

    return searchResults.when(
      data: (workplaces) {
        if (workplaces.isEmpty) {
          // return Text('No workplace found'.hardcoded);
          return NoWorkplaceFound();
        }
        return ListView.builder(
          itemCount: workplaces.length,
          itemBuilder: (context, index) {
            final workplace = workplaces[index];
            return ListTile(
              leading: const Icon(Icons.store),
              // title: Text(workplace.name),
              title: RichText(
                text: TextSpan(
                  style: TextStyle(color: textColor), // Default text color
                  children: workplace.highlightedName!.toInlineSpans(
                    highlightedTextStyle: TextStyle(
                      color: highlightColor, // Adaptive highlight color
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              subtitle: MaterialText.labelMedium(
                  '${workplace.city} - ${workplace.country}', context),
              trailing: const Icon(Icons.add),
              onTap: () {},
            );
          },
        );
      },
      error: (error, stack) => Text('Error : $error'),
      loading: () => const Center(
        child: SizedBox(
          height: 75,
          width: 75,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
