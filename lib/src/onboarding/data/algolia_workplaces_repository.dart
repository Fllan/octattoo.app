import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:octattoo_app/src/onboarding/domain/workplace.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'algolia_workplaces_repository.g.dart';

class AlgoliaWorkplacesRepository {
  final HitsSearcher searcher;

  AlgoliaWorkplacesRepository({
    required String applicationId,
    required String apiKey,
  }) : searcher = HitsSearcher(
          applicationID: dotenv.env['ALGOLIA_APP_ID']!,
          apiKey: dotenv.env['ALGOLIA_SEARCH_KEY']!,
          indexName: 'octattoo_app_aug24_workplaces',
        );

  // Subscribe to the results stream for real-time updates
  Stream<List<Workplace>> get searchResults =>
      searcher.responses.map((response) {
        return response.hits.map((hit) {
          final data = hit;
          return Workplace(
            id: data['objectID'] as String,
            creatorUid: data['creatorUid'] as String,
            managerUid: data['managerUid'] as String,
            createdAt: DateTime.parse(data['createdAt'] as String),
            updatedAt: DateTime.parse(data['updatedAt'] as String),
            name: data['name'] as String,
            street: data['street'] as String,
            city: data['city'] as String,
            province: data['province'] as String,
            country: data['country'] as String,
            postalCode: data['postalCode'] as String,
          );
        }).toList();
      });

  // Function to set the search term and trigger a new search
  void search(String searchTerm) {
    return searcher.query(searchTerm);
  }
}

@riverpod
AlgoliaWorkplacesRepository algoliaWorkplacesRepository(Ref ref) {
  return AlgoliaWorkplacesRepository(
      applicationId: dotenv.env['ALGOLIA_APP_ID']!,
      apiKey: dotenv.env['ALGOLIA_SEARCH_KEY']!);
}

@riverpod
Stream<List<Workplace>> workplacesSearchResults(Ref ref) {
  final repository = ref.watch(algoliaWorkplacesRepositoryProvider);
  return repository.searchResults;
}
