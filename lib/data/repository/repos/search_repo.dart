import 'package:graphql_flutter/graphql_flutter.dart';

import '../../models/article_response.dart';
import 'i_search_repo.dart';

class SearchRepo extends ISearchRepo {
  SearchRepo({required this.client});
  final GraphQLClient client;

  @override
  Future<ArticlesResponse> getSearchArticles({
    required String searchText,
    required String sortId,
  }) async {
    try {
      final QueryResult result = await client.query(
        QueryOptions(
          document: gql('''
            query GetSearchArticles(\$query: String!, \$sort: String!) {
              searchArticles(query: \$query, sort: \$sort) {
                title
                description
                url
              }
            }
          '''),
          variables: {
            'query': searchText,
            'sort': sortId,
          },
        ),
      );

      if (result.hasException) {
        throw Exception(result.exception.toString());
      }

      return ArticlesResponse.fromJson(result.data.toString());
    } catch (e) {
      throw Exception('GraphQL Query Error: $e');
    }
  }
}
