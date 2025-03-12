import '../../models/characters_response.dart';

abstract class IHomoRepo {
  Future<CharactersResponse> getCharacters({
    required int page,
    required String searchQuery,
  });
}
