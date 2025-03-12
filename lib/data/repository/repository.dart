import 'package:graphql_flutter/graphql_flutter.dart';
import '../dio_settings/dio_client.dart';
import 'repos/home_repo.dart';
import 'repos/i_home_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'repos/i_search_repo.dart';
import 'repos/search_repo.dart';

class Repository {
  late IHomoRepo homeRepo;
  late ISearchRepo searchRepo;
  GraphQLService? graphQLService;

  Future init() async {
    final prefs = await SharedPreferences.getInstance();
    final client = _getGraphQLClient(prefs);

    homeRepo = HomeRepo(client: client);
    searchRepo = SearchRepo(client: client);
  }

  GraphQLClient _getGraphQLClient(SharedPreferences preferences) {
    graphQLService = GraphQLService();
    return graphQLService!.client;
  }
}
