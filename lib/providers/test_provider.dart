import 'package:flutter/material.dart';
import '../data/models/test_models/option_model.dart';

class TestProvider extends ChangeNotifier {
  int _activePage = 0;
  Option? _selected;

  final PageController controller = PageController();

  int get progress => _activePage;
  Option? get selected => _selected;

  set activePage(int newValue) {
    _activePage = newValue;
    notifyListeners();
  }

  set selected(Option? newValue) {
    _selected = newValue;
    notifyListeners();
  }

  void nextPage() async {
    await controller.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }
}
