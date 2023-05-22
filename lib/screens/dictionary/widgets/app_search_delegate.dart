import 'package:flutter/material.dart';
import 'package:dictionary/data/models/vocabulary_model/vocabulary_model.dart';
import '../../../res/themes.dart';
import '../vocabulary_screen.dart';

class AppSearchDelegate extends SearchDelegate {
  final List<Vocabulary> dataList;
  final void Function(Vocabulary) onItemSelected;

  AppSearchDelegate({
    required this.dataList,
    required this.onItemSelected,
  });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Vocabulary> matchQuery = [];
    if (query.isNotEmpty) {
      List<Vocabulary> tempList = [];
      for (var item in dataList) {
        if (item.word!.toLowerCase().contains(query.toLowerCase())) {
          tempList.add(item);
        }
      }
      matchQuery = tempList;
    } else {
      matchQuery = [];
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        return Card(
          color: AppColors.white,
          elevation: 2,
          child: ListTile(
            onTap: () {
              onItemSelected(matchQuery[index]);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return VocabularyScreen(vocabulary: matchQuery[index]);
                  },
                ),
              );
            },
            title: Text(matchQuery[index].word!),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Vocabulary> matchQuery = [];
    if (query.isNotEmpty) {
      List<Vocabulary> tempList = [];
      for (var item in dataList) {
        if (item.word!.toLowerCase().contains(query.toLowerCase())) {
          tempList.add(item);
        }
      }
      matchQuery = tempList;
    } else {
      matchQuery = [];
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        return Card(
          color: AppColors.white,
          elevation: 2,
          child: ListTile(
            onTap: () {
              onItemSelected(matchQuery[index]);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return VocabularyScreen(vocabulary: matchQuery[index]);
                  },
                ),
              );
            },
            title: Text(matchQuery[index].word!),
          ),
        );
      },
    );
  }
}
