import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/dictionary_provider.dart';
import '../../res/themes.dart';
import '../widgets/app_text_fields.dart';

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
  @override
  Widget build(BuildContext context) {
    //var provider = Provider.of<DictionaryProvider>(context);

    return ListView(
      children: [
        const HeaderWidget(),
        const SizedBox(height: 20),
        AppTextFormField(
          hintText: 'Find interesting words',
          prefixIcon: const Icon(CupertinoIcons.search),
        ),
        const SizedBox(height: 10),
        Container(
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
                          'Word',
                          style: AppTextStyle.medium25,
                        ),
                        Text(
                          'type',
                          style: AppTextStyle.regular15,
                        ),
                        Text(
                          '/phonetics/',
                          style: AppTextStyle.regular15,
                        )
                      ],
                    ),
                  ),
                  const Expanded(
                    flex: 2,
                    child: Icon(
                      CupertinoIcons.speaker_3,
                      size: 40,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                        onTap: () {
                          // var markFavorite = provider.markFavorite;
                          // markFavorite;
                        },
                        child: // provider.isFavorite
                            // ?
                            const Icon(
                          CupertinoIcons.bookmark_fill,
                          size: 50,
                          color: AppColors.darkBrown,
                        )
                        // : const Icon(
                        //     CupertinoIcons.bookmark,
                        //     size: 50,
                        //   ),
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
              Image.network(
                'https://cdn-icons-png.flaticon.com/512/384/384998.png',
                scale: 3,
              ),
              const SizedBox(height: 30),
              Text(
                'Meaning',
                style: AppTextStyle.medium25,
              ),
              Text(
                'This is the meaning of the word',
                style: AppTextStyle.regular15,
                overflow: TextOverflow.visible,
              ),
              const SizedBox(height: 30),
              Text(
                'Example',
                style: AppTextStyle.medium25,
              ),
              Text(
                'This is the hint/example of the word',
                style: AppTextStyle.regular15,
                overflow: TextOverflow.visible,
              ),
            ],
          ),
        )
      ],
    );
  }
}
