import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data/models/vocabulary_model/vocabulary_model.dart';

class DictionarySearchBar extends SearchDelegate<String> {
  final List<Vocabulary> vocabularies;

  DictionarySearchBar(this.vocabularies);

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
    final results = vocabularies.where((vocabulary) {
      return vocabulary.word!.toLowerCase().contains(query.toLowerCase());
    });

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            results.elementAt(index) as String,
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = vocabularies.where((vocabulary) {
      return vocabulary.word!.toLowerCase().contains(query.toLowerCase());
    });

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            suggestions.elementAt(index) as String,
          ),
        );
      },
    );
  }
}

class DictionarySearchBarWidget extends StatefulWidget {
  const DictionarySearchBarWidget({super.key});

  @override
  State<DictionarySearchBarWidget> createState() =>
      _DictionarySearchBarWidgetState();
}

class _DictionarySearchBarWidgetState extends State<DictionarySearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
