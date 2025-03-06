part of 'app_main_bloc.dart';

@immutable
sealed class MainBlocState {}

class AppMainInitial extends MainBlocState {}

class AppMainHomeScreen extends MainBlocState {}

class SplashState extends MainBlocState {}

class RegionChangeState extends MainBlocState {
  RegionChangeState({required this.regionCode});

  final String regionCode;
}
