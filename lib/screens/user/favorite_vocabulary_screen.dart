import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data/services/user_service.dart';
import '../../data/services/vocabulary_service.dart';
import '../../res/themes.dart';
import '../../utils.dart';
import '../dictionary/widgets/pronounce_widget.dart';
import '../home/widgets/app_bar_widget.dart';

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
        future: UserFavoriteCollectionService()
            .getFavoriteVocabulary(UserService.currentUserId!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var favorite = snapshot.data!;
            return favorite.isNotEmpty
                ? ListView.separated(
                    padding: const EdgeInsets.all(10),
                    itemCount: favorite.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 20);
                    },
                    itemBuilder: (context, index) {
                      return FavoriteVocabularyWidget(
                        vocabularyId: favorite[index].vocabularyId!,
                      );
                    },
                  )
                : Center(
                    child: Text(
                      'Your favorite vocabularies appear hear',
                      style: AppTextStyle.medium15.copyWith(
                        color: AppColors.gray,
                      ),
                    ),
                  );
          } else {
            return const AppLoadingIndicator();
          }
        },
      ),
    );
  }
}

class FavoriteVocabularyWidget extends StatelessWidget {
  final String vocabularyId;
  const FavoriteVocabularyWidget({
    super.key,
    required this.vocabularyId,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: VocabularyService().getVocabularyById(vocabularyId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var vocabulary = snapshot.data!;
          return Container(
            padding: const EdgeInsets.all(10),
            decoration: AppContainerStyle.border.copyWith(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: vocabulary.word,
                            style: AppTextStyle.bold25.copyWith(
                              color: AppColors.darkGreen,
                              fontSize: 20,
                            ),
                          ),
                          TextSpan(
                            text: ' [${vocabulary.phonetics}]',
                            style: AppTextStyle.phonetics,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: PronounceWidget(url: vocabulary.pronounce!),
                    ),
                  ],
                ),
                Text(
                  '*${vocabulary.type}',
                  style: AppTextStyle.regular15.copyWith(
                    color: AppColors.darkRed,
                  ),
                ),
                const SizedBox(height: 5),
                const Divider(
                  color: AppColors.black,
                  thickness: 2,
                ),
                Image.network(
                  vocabulary.image!,
                  scale: 3,
                ),
                const SizedBox(height: 30),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Meaning: ',
                        style: AppTextStyle.bold15.copyWith(
                          color: AppColors.darkGreen,
                        ),
                      ),
                      TextSpan(
                        text: vocabulary.meaning,
                        style: AppTextStyle.regular13,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Example: ',
                        style: AppTextStyle.bold15.copyWith(
                          color: AppColors.darkGreen,
                        ),
                      ),
                      TextSpan(
                        text: vocabulary.hint,
                        style: AppTextStyle.regular13,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
