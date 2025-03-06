import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension MainContextExtension on BuildContext {
  AppLocalizations get locale => AppLocalizations.of(this)!;

  ThemeData get theme => Theme.of(this);

  //Navigator
  NavigatorState get navigator => Navigator.of(this);

  void get pop => navigator.pop();
}
