import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rickandmortyapp/models/character_model.dart';
import 'package:rickandmortyapp/services/graphql/graphql_client.dart';
import 'package:rickandmortyapp/services/graphql/queries/character_queries.dart';

class CharacterGraphqlService {
  static Future<List<CharacterModel>> fetchCharactersByIds(
      List<int> ids) async {
    final query = gql(CharacterQueries.fetchByIds);

    final result = await GraphQLService.client.query(
      QueryOptions(
        document: query,
        variables: {'ids': ids},
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final List data = result.data?['charactersByIds'] ?? [];
    return data.map((json) => CharacterModel.fromJson(json)).toList();
  }
}
