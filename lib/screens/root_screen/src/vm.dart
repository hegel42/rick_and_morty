import 'package:flutter/material.dart';

class RootScreenViewModel extends ChangeNotifier {
  int activeIndex = 0;

  final navigatorKeys = <GlobalKey<NavigatorState>>[
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  void changeScreen(int index) {
    if (index == activeIndex) {
      navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
    }
    activeIndex = index;
    notifyListeners();
  }
}
