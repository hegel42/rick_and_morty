import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import '../../../../data/models/characters_response.dart';
import '../../../../data/repository/repository.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc(this.repository) : super(HomeScreenLoading()) {
    on<InitFetchEvent>(_onDataFetch);
    on<FetchNext>(_loadNext);
  }

  List<Character> characters = [];
  int page = 1;
  int totalPages = 10;
  String searchQuery = '';

  FutureOr<void> _loadNext(FetchNext event, emit) async {
    try {
      if (page < totalPages) {
        final response = await repository.homeRepo.getCharacters(
          page: page,
          searchQuery: searchQuery,
        );

        totalPages = response.pages;

        page++;

        characters.addAll(response.charactersList);

        emit(
          HomeScreenDataState(
            characters: characters,
          ),
        );
      }
    } catch (e) {
      emit(HomeScreenError());
      Logger().e(e);
    }
  }

  FutureOr<void> _onDataFetch(
    InitFetchEvent event,
    Emitter<HomeScreenState> emit,
  ) async {
    page = 1;
    searchQuery = '';
    totalPages = 10;
    characters.clear();
    try {
      searchQuery = event.searchQuery ?? '';

      emit(HomeScreenLoading());

      final response = await repository.homeRepo.getCharacters(
        page: page,
        searchQuery: searchQuery,
      );

      totalPages = response.pages;

      page++;

      characters.addAll(response.charactersList);

      emit(
        HomeScreenDataState(
          characters: characters,
        ),
      );
    } catch (e) {
      emit(HomeScreenError());
      Logger().e(e);
    }
  }

  final Repository repository;
}
