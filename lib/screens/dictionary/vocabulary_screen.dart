import 'package:flutter/material.dart';

import '../../data/models/vocabulary_model/vocabulary_model.dart';
import '../../main.dart';
import '../../res/themes.dart';
import 'widgets/pronounce_widget.dart';
import 'widgets/vocabulary_favorite_marker.dart';

class VocabularyScreen extends StatelessWidget {
  final Vocabulary vocabulary;
  const VocabularyScreen({
    super.key,
    required this.vocabulary,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Word of the day',
          style: AppTextStyle.medium20,
        ),
        centerTitle: true,
        backgroundColor: AppColors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(
            top: 10,
            bottom: 150,
            left: 10,
            right: 10,
          ),
          decoration: AppContainerStyle.border.copyWith(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              prefs.getString('userId') != null
                  ? Align(
                      alignment: Alignment.topRight,
                      child: VocabularyFavoriteMarker(
                        userId: prefs.getString('userId')!,
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
        ),
      ),
    );
  }
}
