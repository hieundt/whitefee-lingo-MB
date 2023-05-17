import 'package:dictionary/data/services/vocabulary_service.dart';
import 'package:dictionary/screens/dictionary/widgets/vocabulary_widget.dart';
import 'package:dictionary/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../home/widgets/app_bar_widget.dart';
import '../../res/themes.dart';

class FavoriteVocabularyScreen extends StatelessWidget {
  const FavoriteVocabularyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        screenTitle: 'Favorite vocabularies',
        titleColor: AppColors.darkBrown,
        leading: Icon(
          CupertinoIcons.bookmark_solid,
          color: AppColors.darkBrown,
        ),
      ),
      body: FutureBuilder(
        future: VocabularyService().getAllVocabulary(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var favorite = snapshot.data!;
            return ListView.separated(
              padding: const EdgeInsets.all(10),
              itemCount: favorite.length,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 20);
              },
              itemBuilder: (context, index) {
                return VocabularyWidget(vocabulary: favorite[index]);
              },
            );
          } else {
            return const AppLoadingIndicator();
          }
        },
      ),
    );
  }
}
