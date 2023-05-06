import 'package:dictionary/data/services/vocabulary_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data/models/vocabulary_model/vocabulary_model.dart';

class DictionarySearch extends SearchDelegate<String> {
  final List<String> words;

  DictionarySearch(this.words);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {},
        icon: const Icon(CupertinoIcons.xmark),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(CupertinoIcons.arrow_left),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = words.where((vocabulary) {
      return vocabulary.toLowerCase().contains(query.toLowerCase());
    });

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            results.elementAt(index),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = words.where((vocabulary) {
      return vocabulary.toLowerCase().contains(query.toLowerCase());
    });

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            suggestions.elementAt(index),
          ),
        );
      },
    );
  }
}

class DictionarySearchBar extends StatefulWidget {
  const DictionarySearchBar({super.key});

  @override
  State<DictionarySearchBar> createState() => _DictionarySearchBarState();
}

class _DictionarySearchBarState extends State<DictionarySearchBar> {
  //final vocabularies = VocabularyService().getAllVocabulary();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: VocabularyService().getAllVocabulary(),
      builder: (context, snapshot) {
        var vocabularies = snapshot.data!;
        return ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
                //leading:Text( vocabularies[index].word),
                );
          },
        );
      },
    );
  }
}
