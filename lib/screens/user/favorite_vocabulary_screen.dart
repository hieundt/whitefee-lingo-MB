import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/services/user_service.dart';
import '../../data/services/vocabulary_service.dart';
import '../../providers/user_provider.dart';
import '../../res/themes.dart';
import '../../utils.dart';
import '../dictionary/widgets/pronounce_widget.dart';
import '../home/widgets/app_bar_widget.dart';

class FavoriteVocabularyScreen extends StatelessWidget {
  const FavoriteVocabularyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //var userProvider = Provider.of<UserProvider>(context).currentUserId;
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
            return ListView.separated(
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
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Text(
                            vocabulary.word!,
                            style: AppTextStyle.bold15,
                          ),
                          Text(
                            vocabulary.type!,
                            style: AppTextStyle.regular15,
                          ),
                          Text(
                            vocabulary.phonetics!,
                            style: AppTextStyle.phonetics,
                          )
                        ],
                      ),
                    ),
                    //! Bug
                    // Expanded(
                    //   flex: 1,
                    //   child: PronounceWidget(
                    //     url: vocabulary.pronounce!,
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(height: 30),
                const Divider(
                  thickness: 3,
                  indent: 20,
                  endIndent: 20,
                  color: AppColors.black,
                ),
                const SizedBox(height: 30),
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
