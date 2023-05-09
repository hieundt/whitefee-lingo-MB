import 'package:flutter/material.dart';
import '../data/models/vocabulary_model/vocabulary_model.dart';

class DictionaryProvider extends ChangeNotifier {
  Vocabulary selectedVocabulary = Vocabulary();

  void handleItemSelected(Vocabulary selectedItem) {
    selectedVocabulary = selectedItem;
    notifyListeners();
  }

  TextEditingController searchController = TextEditingController();
  List<Vocabulary> _vocabularyList = [];
  List<Vocabulary> get vocabularyList => _vocabularyList;
  set vocabularyList(List<Vocabulary> value) {
    _vocabularyList = value;
    notifyListeners();
  }

  List<Vocabulary> filteredList = []; // Filtered list based on search
  void filterSearchResults(String query) {
    if (query.isNotEmpty) {
      List<Vocabulary> tempList = [];
      for (var item in _vocabularyList) {
        if (item.word!.toLowerCase().contains(query.toLowerCase())) {
          tempList.add(item);
        }
      }
      filteredList = tempList;
    } else {
      filteredList = [];
    }
    notifyListeners(); // Notify listeners to update the UI
  }
}
