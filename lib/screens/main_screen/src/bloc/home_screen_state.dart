part of 'home_screen_bloc.dart';

@immutable
sealed class HomeScreenState {}

final class HomeScreenLoading extends HomeScreenState {}

final class HomeScreenError extends HomeScreenState {}

final class HomeScreenDataState extends HomeScreenState {
  HomeScreenDataState({required this.characters});

  final List<Character> characters;
}
