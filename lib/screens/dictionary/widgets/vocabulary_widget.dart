import 'package:dictionary/data/services/user_service.dart';
import 'package:dictionary/res/images.dart';
import 'package:dictionary/screens/dictionary/widgets/vocabulary_favorite_marker.dart';
import 'package:flutter/cupertino.dart';
import '../../../data/models/vocabulary_model/vocabulary_model.dart';
import '../../../res/themes.dart';
import 'pronounce_widget.dart';

class VocabularyWidget extends StatelessWidget {
  final Vocabulary vocabulary;
  const VocabularyWidget({
    super.key,
    required this.vocabulary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  child: vocabulary.id == null
                      ? const Icon(
                          CupertinoIcons.bookmark,
                          size: 50,
                        )
                      : VocabularyFavoriteMarker(
                          userId: UserService.currentUserId!,
                          vocabularyId: vocabulary.id!,
                        ),
                )
              : const SizedBox(
                  height: 50,
                  width: 50,
                ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: vocabulary.word ?? 'Vocabulary ',
                        style: AppTextStyle.bold25.copyWith(
                          fontSize: 20,
                        ),
                      ),
                      TextSpan(
                        text: ' [${vocabulary.phonetics ?? 'phonetics'}]',
                        style: AppTextStyle.phonetics,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: vocabulary.pronounce != null
                    ? PronounceWidget(url: vocabulary.pronounce ?? '')
                    : const Icon(
                        CupertinoIcons.speaker_3,
                        size: 40,
                      ),
              ),
            ],
          ),
          Text(
            vocabulary.type ?? 'type',
            style: AppTextStyle.regular25,
          ),
          const SizedBox(height: 10),
          vocabulary.image != null
              ? Image.network(
                  vocabulary.image!,
                  scale: 3,
                )
              : Image.asset(
                  DictionaryScreenImage.blank,
                  scale: 5,
                ),
          const SizedBox(height: 30),
          Text(
            'Meaning',
            style: AppTextStyle.medium25,
          ),
          Text(
            vocabulary.meaning ?? 'Meaning of the vocabulary',
            style: AppTextStyle.regular15,
            overflow: TextOverflow.visible,
          ),
          const SizedBox(height: 30),
          Text(
            'Example',
            style: AppTextStyle.medium25,
          ),
          Text(
            vocabulary.hint ?? 'Example of the vocabulary',
            style: AppTextStyle.regular15,
            overflow: TextOverflow.visible,
          ),
        ],
      ),
    );
  }
}
