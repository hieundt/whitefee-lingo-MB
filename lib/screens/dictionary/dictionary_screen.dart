import 'package:dictionary/screens/dictionary/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/models/vocabulary_model/vocabulary_model.dart';
import '../../data/services/vocabulary_service.dart';
import '../../providers/dictionary_provider.dart';
import '../../res/themes.dart';
import 'widgets/vocabulary_widget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Let\'s ',
                style: AppTextStyle.regular25,
              ),
              TextSpan(
                text: 'explore',
                style: AppTextStyle.regular25,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          'something new',
          style: AppTextStyle.bold25.copyWith(
            color: AppColors.transparent,
            shadows: [
              const Shadow(
                offset: Offset(0, -5),
                color: AppColors.darkGreen,
              ),
            ],
            decoration: TextDecoration.underline,
            decorationThickness: 7,
            decorationColor: AppColors.yellow,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({super.key});

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  String word = 'sunset';

  void handleItemSelected(Vocabulary selectedItem) {
    setState(() {
      word = selectedItem.word!;
    });
  }

  @override
  Widget build(BuildContext context) {
    //var vocabularies = Provider.of<DictionaryProvider>(context).vocabularyList;
    return ListView(
      children: [
        const HeaderWidget(),
        FutureBuilder<List<Vocabulary>>(
          future: VocabularyService().getAllVocabulary(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var vocabularies = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    DictionarySearchBar(
                      dataList: vocabularies,
                      onItemSelected: handleItemSelected,
                    ),
                    const SizedBox(height: 20),
                    VocabularyWidget(displayVocabulary: word),
                  ],
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ],
    );
  }
}
