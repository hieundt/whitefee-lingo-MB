import 'package:flutter/material.dart';

class DictionaryProvider extends ChangeNotifier {
  bool _isFavorite = false;

  bool get isFavorite => _isFavorite;

  set isFavorite(bool marker) {
    _isFavorite = marker;
    notifyListeners();
  }
}
