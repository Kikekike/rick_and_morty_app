import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rickandmortyapp/models/location_model.dart';
import 'package:rickandmortyapp/services/graphql/graphql_client.dart';
import 'package:rickandmortyapp/services/graphql/queries/location_queries.dart';

class LocationService {
  static Future<Map<String, dynamic>> fetchLocationsByName({
    required String name,
    required int page,
  }) async {
    final query = gql(LocationQueries.fetchByName);

    final result = await GraphQLService.client.query(
      QueryOptions(
        document: query,
        variables: {'name': name, 'page': page},
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final data = result.data?['locations'];
    final List results = data?['results'] ?? [];
    final List<LocationModel> locations =
        results.map((json) => LocationModel.fromJson(json)).toList();

    return {
      'locations': locations,
      'hasNextPage': data?['info']?['next'] != null,
    };
  }
}
