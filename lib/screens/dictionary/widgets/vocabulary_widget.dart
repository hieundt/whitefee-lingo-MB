import 'package:flutter/material.dart';

import '../../../data/models/vocabulary_model/vocabulary_model.dart';
import '../../../data/services/user_service.dart';
import '../../../res/themes.dart';
import 'header_widget.dart';
import 'pronounce_widget.dart';
import 'vocabulary_favorite_marker.dart';

class VocabularyWidget extends StatelessWidget {
  final Vocabulary vocabulary;
  const VocabularyWidget({
    super.key,
    required this.vocabulary,
  });

  @override
  Widget build(BuildContext context) {
    return vocabulary.id != null
        ? Container(
            padding: const EdgeInsets.all(10),
            decoration: AppContainerStyle.border.copyWith(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserService.currentUserId != null
                    ? Align(
                        alignment: Alignment.topRight,
                        child: VocabularyFavoriteMarker(
                          userId: UserService.currentUserId!,
                          vocabularyId: vocabulary.id!,
                        ),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(height: 5),
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
          )
        : const Padding(
            padding: EdgeInsets.only(top: 150),
            child: Center(
              child: HeaderWidget(),
            ),
          );
  }
}
