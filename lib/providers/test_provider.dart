import 'package:flutter/material.dart';
import '../data/models/test_models/option_model.dart';

class TestProvider extends ChangeNotifier {
  Option? _selected;

  Option? get selected => _selected;

  set selected(Option? newValue) {
    _selected = newValue;
    notifyListeners();
  }

  int? _totalPoint = 0;
  int? get totalPoint => _totalPoint;
  void addPoint(int point) {
    _totalPoint = _totalPoint! + point;
    notifyListeners();
  }

  void resetPoint() {
    _totalPoint = 0;
  }
}
