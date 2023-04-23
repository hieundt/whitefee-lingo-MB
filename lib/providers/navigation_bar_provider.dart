import 'package:flutter/material.dart';

class AppNavigationBarProvider extends ChangeNotifier {
  int currentIndex = 0;

  void onTapChanged(changedIndex) {
    currentIndex = changedIndex;
    notifyListeners();
  }
}
