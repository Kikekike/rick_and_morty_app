import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rickandmortyapp/services/api_constants.dart';

class GraphQLService {
  static final HttpLink _httpLink = HttpLink(ApiConstants.baseUrlGraphql);

  static final GraphQLClient client = GraphQLClient(
    link: _httpLink,
    cache: GraphQLCache(store: HiveStore()),
  );
}
