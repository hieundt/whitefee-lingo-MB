import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  late String? _currentUserId;

  String? get currentUserId => _currentUserId;

  set currentUserId(String? id) {
    _currentUserId = id;
    notifyListeners();
  }
}
