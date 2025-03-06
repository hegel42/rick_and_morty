part of 'home_screen_bloc.dart';

@immutable
sealed class HomeScreenEvent {}

class FetchHomeDataEvent extends HomeScreenEvent {
  FetchHomeDataEvent({this.regionCode});

  final String? regionCode;
}

class LoadNextEvent extends HomeScreenEvent {}
