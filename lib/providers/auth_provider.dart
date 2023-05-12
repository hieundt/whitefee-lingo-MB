import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _hidePassword = true;
  bool get hidePassword => _hidePassword;
  void showPassword() {
    _hidePassword = !_hidePassword;
    notifyListeners();
  }

  DateTime _birthday = DateTime.now();
  DateTime get birthday => _birthday;
  set birthday(DateTime value) {
    _birthday = value;
    notifyListeners();
  }
}
