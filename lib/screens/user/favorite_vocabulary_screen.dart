import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../navigator/widgets/app_bar_widget.dart';
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
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: 10,
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
        itemBuilder: (context, index) {
          return Hero(
            tag: 'vocabularyTag',
            child: Material(
              color: AppColors.base,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(
                  color: AppColors.black,
                  width: 2,
                ),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetailFavoriteVocabulary(),
                    ),
                  );
                },
                child: ListTile(
                  title: Text(
                    'test$index',
                    style: AppTextStyle.medium15,
                  ),
                  subtitle: Text(
                    'test$index',
                    style: AppTextStyle.regular15,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailFavoriteVocabulary extends StatelessWidget {
  const DetailFavoriteVocabulary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Hero(
          tag: 'vocabularyTag',
          child: Text('Your favorite vocabulary'),
        ),
      ),
    );
  }
}
