import 'package:graphql_flutter/graphql_flutter.dart';
import '../../models/characters_response.dart';
import 'i_home_repo.dart';

class HomeRepo extends IHomoRepo {
  HomeRepo({required this.client});
  final GraphQLClient client;

  @override
  Future<CharactersResponse> getCharacters({
    required int page,
    required String searchQuery,
  }) async {
    final result = await client.query(
      QueryOptions(
        document: gql('''
query Query(\$page: Int, \$filter: FilterCharacter) {
  characters(page: \$page, filter: \$filter) {
    results {
      gender
      id
      image
      name
      status
      type
    }
    info {
      pages
      count
    }
  }
}
'''),
        variables: {
          'page': page,
          'filter': {
            'name': searchQuery,
          },
        },
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    return CharactersResponse.fromJson(result.data!);
  }
}
