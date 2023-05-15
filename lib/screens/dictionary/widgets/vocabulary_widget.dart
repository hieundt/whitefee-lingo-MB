import 'package:dictionary/res/images.dart';
import 'package:dictionary/screens/dictionary/widgets/pronounce_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../data/models/vocabulary_model/vocabulary_model.dart';
import '../../../res/themes.dart';

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
                      vocabulary.word ?? 'Vocabulary',
                      style: AppTextStyle.bold15,
                    ),
                    Text(
                      vocabulary.type ?? 'type',
                      style: AppTextStyle.regular15,
                    ),
                    Text(
                      vocabulary.phonetics ?? 'phonetics',
                      style: AppTextStyle.phonetics,
                    )
                  ],
                ),
              ),
              vocabulary.pronounce != null
                  ? Expanded(
                      flex: 1,
                      child: PronounceWidget(url: vocabulary.pronounce ?? ''),
                    )
                  : const Icon(
                      CupertinoIcons.speaker_3,
                      size: 40,
                    ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    CupertinoIcons.bookmark_fill,
                    size: 50,
                    color: AppColors.darkBrown,
                  ),
                ),
              ),
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


// class VocabularyWidget extends StatelessWidget {
//   final String displayVocabulary;
//   const VocabularyWidget({
//     super.key,
//     required this.displayVocabulary,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<Vocabulary>(
//       future: VocabularyService().getVocabularyByWord(displayVocabulary),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           var vocabulary = snapshot.data!;
//           return Container(
//             padding: const EdgeInsets.all(10),
//             decoration: AppContainerStyle.border.copyWith(
//               color: AppColors.white,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Expanded(
//                       flex: 2,
//                       child: Column(
//                         children: [
//                           Text(
//                             vocabulary.word ?? 'word',
//                             style: AppTextStyle.medium25,
//                           ),
//                           Text(
//                             vocabulary.type ?? 'type',
//                             style: AppTextStyle.regular15,
//                           ),
//                           Text(
//                             vocabulary.phonetics ?? 'phonetics',
//                             style: AppTextStyle.regular15,
//                           )
//                         ],
//                       ),
//                     ),
//                     const Expanded(
//                       flex: 2,
//                       child: Icon(
//                         CupertinoIcons.speaker_3,
//                         size: 40,
//                       ),
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: GestureDetector(
//                           onTap: () {},
//                           child:
//                               // ?
//                               const Icon(
//                             CupertinoIcons.bookmark_fill,
//                             size: 50,
//                             color: AppColors.darkBrown,
//                           )),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 30),
//                 const Divider(
//                   thickness: 3,
//                   indent: 20,
//                   endIndent: 20,
//                   color: AppColors.black,
//                 ),
//                 const SizedBox(height: 30),
//                 Image.network(
//                   vocabulary.image ?? '',
//                   scale: 3,
//                 ),
//                 const SizedBox(height: 30),
//                 Text(
//                   'Meaning',
//                   style: AppTextStyle.medium25,
//                 ),
//                 Text(
//                   vocabulary.meaning ?? 'meaning',
//                   style: AppTextStyle.regular15,
//                   overflow: TextOverflow.visible,
//                 ),
//                 const SizedBox(height: 30),
//                 Text(
//                   'Example',
//                   style: AppTextStyle.medium25,
//                 ),
//                 Text(
//                   vocabulary.hint ?? 'hint',
//                   style: AppTextStyle.regular15,
//                   overflow: TextOverflow.visible,
//                 ),
//               ],
//             ),
//           );
//         } else {
//           return const CircularProgressIndicator();
//         }
//       },
//     );
//   }
// }
