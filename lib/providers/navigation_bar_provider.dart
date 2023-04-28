import 'package:flutter/material.dart';

// class AppNavBarItemProvider extends ChangeNotifier {
//   bool _isSelected = false;

//   set isSelected() {
//     _isSelected = true;
//   }
// }

class AppNavigationBarProvider extends ChangeNotifier {
  int _currentIndex = 0;
  bool _enable = true;

  int get currentIndex => _currentIndex;

  set currentIndex(changedIndex) {
    _currentIndex = changedIndex;
    notifyListeners();
  }

  bool get enable => _enable;

  set enable(isEnable) {
    _enable = isEnable;
  }
}
