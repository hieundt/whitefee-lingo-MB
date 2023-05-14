import 'package:flutter/material.dart';
import '../data/models/vocabulary_model/vocabulary_model.dart';

class DictionaryProvider extends ChangeNotifier {
  Vocabulary selectedVocabulary = Vocabulary();

  void handleItemSelected(Vocabulary selectedItem) {
    selectedVocabulary = selectedItem;
    notifyListeners();
  }
}
