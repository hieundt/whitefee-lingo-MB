import 'package:flutter/material.dart';

class AppNavigationBarProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(changedIndex) {
    _currentIndex = changedIndex;
    notifyListeners();
  }
}
