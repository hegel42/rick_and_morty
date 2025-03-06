import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'common/bloc/app_main_bloc.dart';
import 'data/provider/change_theme_provider.dart';
import 'data/provider/locale_provider.dart';
import 'data/repository/repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(create: (_) => ChangeThemeProvider()),
      ],
      builder: (context, child) {
        return MultiRepositoryProvider(
          providers: [
            RepositoryProvider(create: (context) => Repository()),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider<AppMainBloc>(
                lazy: false,
                create: (context) => AppMainBloc(
                  repository: context.read<Repository>(),
                )..add(AppStartedEvent()),
              ),
            ],
            child: const MainApp(),
          ),
        );
      },
    ),
  );
}
