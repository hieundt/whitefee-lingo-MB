import 'package:dictionary/res/themes.dart';
import 'package:dictionary/screens/dictionary/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/models/vocabulary_model/vocabulary_model.dart';
import '../../data/services/vocabulary_service.dart';
import '../../providers/dictionary_provider.dart';
import '../../utils.dart';
import 'widgets/header_widget.dart';
import 'widgets/vocabulary_widget.dart';

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({super.key});

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DictionaryProvider>(context);
    return ListView(
      children: [
        const HeaderWidget(),
        const SizedBox(height: 20),
        FutureBuilder<List<Vocabulary>>(
          future: VocabularyService().getAllVocabulary(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var vocabularies = snapshot.data!;
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 100),
                      VocabularyWidget(vocabulary: provider.selectedVocabulary),
                    ],
                  ),
                  DictionarySearchBar(
                    dataList: vocabularies,
                    onItemSelected: provider.handleItemSelected,
                  ),
                ],
              );
            } else {
              return const AppLoadingIndicator();
            }
          },
        ),
      ],
    );
  }
}
