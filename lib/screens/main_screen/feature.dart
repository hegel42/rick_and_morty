import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/repository.dart';
import 'src/bloc/home_screen_bloc.dart';
import 'src/main_screen.dart';

CupertinoPageRoute mainScreenRoute(RouteSettings route) {
  return CupertinoPageRoute(
    settings: route,
    builder: (context) => BlocProvider(
      create: (context) =>
          HomeScreenBloc(context.read<Repository>())..add(InitFetchEvent()),
      child: const MainScreen(),
    ),
  );
}
