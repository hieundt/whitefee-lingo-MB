import 'package:flutter/material.dart';
import '../data/models/vocabulary_model/vocabulary_model.dart';

class DictionaryProvider extends ChangeNotifier {
  List<Vocabulary> vocabularyList = [];

  List<Vocabulary> filteredList = [];

  void filterSearchResults(String query) {
    if (query.isNotEmpty) {
      List<Vocabulary> tempList = [];
      for (var item in vocabularyList) {
        if (item.word!.toLowerCase().contains(query.toLowerCase())) {
          tempList.add(item);
          notifyListeners();
        }
      }
      filteredList = vocabularyList;
      notifyListeners();
    } else {
      filteredList = [];
      notifyListeners();
    }
  }
}
