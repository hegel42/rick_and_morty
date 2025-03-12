part of 'home_screen_bloc.dart';

@immutable
sealed class HomeScreenEvent {}

class InitFetchEvent extends HomeScreenEvent {
  InitFetchEvent({this.searchQuery});

  final String? searchQuery;
}

class FetchNext extends HomeScreenEvent {
  FetchNext({this.searchQuery});

  final String? searchQuery;
}
