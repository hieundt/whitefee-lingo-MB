import 'package:flutter/cupertino.dart';
import '../data/models/user_models/user_model.dart';

class UserProvider extends ChangeNotifier {
  User? _currentUser;
  User? get currentUser => _currentUser;
  set currentUser(User? user) {
    _currentUser = user;
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

  void logout() {
    _currentUser = null;
    notifyListeners();
  }
}
