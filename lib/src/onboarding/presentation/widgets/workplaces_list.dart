import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/core/localization/l10n_extensions.dart';
import 'package:octattoo_app/src/onboarding/data/algolia_workplaces_repository.dart';

class WorkplacesList extends ConsumerWidget {
  const WorkplacesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchResults = ref.watch(workplacesSearchResultsProvider);
    return searchResults.when(
      data: (workplaces) {
        if (workplaces.isEmpty) {
          return Text('No workplace found'.hardcoded);
        }
        return ListView.builder(
          itemCount: workplaces.length,
          itemBuilder: (context, index) {
            final workplace = workplaces[index];
            return ListTile(
              leading: const Icon(Icons.store),
              title: Text(workplace.name),
              subtitle: Text('${workplace.city} - ${workplace.country}'),
              trailing: const Icon(Icons.add),
              onTap: () {},
            );
          },
        );
      },
      error: (error, stack) => Text('Error : $error'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}







// import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:octattoo_app/src/onboarding/data/firebase_workplaces_repository.dart';

// class WorkplacesList extends ConsumerWidget {
//   const WorkplacesList({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final workplacesRepository = ref.watch(workplacesRepositoryProvider);
//     final query = workplacesRepository.queryWorkplaces();

//     return FirestoreQueryBuilder(
//       query: query,
//       builder: (context, snapshot, _) {
//         if (snapshot.isFetching) {
//           return const CircularProgressIndicator();
//         }
//         if (snapshot.hasError) {
//           return Text('Something went wrong! ${snapshot.error}');
//         }
//         return ListView.builder(
//           itemCount: snapshot.docs.length,
//           itemBuilder: (context, index) {
//             if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
//               snapshot.fetchMore();
//             }
//             final workplace = snapshot.docs[index].data();
//             return ListTile(
//               leading: const Icon(Icons.store),
//               title: Text(workplace.name),
//               subtitle: Text('${workplace.city} - ${workplace.country}'),
//               trailing: const Icon(Icons.add),
//               onTap: () {},
//             );
//           },
//         );
//       },
//     );
//   }
// }
