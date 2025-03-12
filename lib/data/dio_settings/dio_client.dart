import 'package:graphql_flutter/graphql_flutter.dart';
import '../../common/constants/network_constants.dart';

class GraphQLService {
  GraphQLService() {
    final httpLink = HttpLink(
      NetworkConstants.BASE_URL,
      // defaultHeaders: {'apiKey': NetworkConstants.KEY},
    );

    client = GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(),
    );
  }
  late final GraphQLClient client;

  Future<QueryResult> performQuery(
    String query, {
    Map<String, dynamic>? variables,
  }) async {
    final options = QueryOptions(
      document: gql(query),
      variables: variables ?? {},
    );
    final result = await client.query(options);
    if (result.hasException) {
      throw Exception(result.exception.toString());
    }
    return result;
  }

  Future<QueryResult> performMutation(
    String mutation, {
    Map<String, dynamic>? variables,
  }) async {
    final options = MutationOptions(
      document: gql(mutation),
      variables: variables ?? {},
    );
    final result = await client.mutate(options);
    if (result.hasException) {
      throw Exception(result.exception.toString());
    }
    return result;
  }
}
