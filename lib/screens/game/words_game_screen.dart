import 'package:flutter/material.dart';
import '../../data/services/vocabulary_service.dart';
import '../../res/themes.dart';

class WordsGameScreen extends StatelessWidget {
  const WordsGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () async {
          final result =
              await VocabularyService().getVocabularyByWord('sunset');
          print(result.word);

          final results = await VocabularyService().getAllVocabulary();
          print(results[4].word);
        },
        child: Container(
          width: 65,
          decoration: AppContainerStyle.border.copyWith(
            color: AppColors.yellow,
          ),
          child: const Icon(
            Icons.home_filled,
            color: AppColors.black,
            size: 35,
          ),
        ),
      ),
    );
  }
}
