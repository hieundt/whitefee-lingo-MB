import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/services/vocabulary_service.dart';
import '../../providers/dictionary_provider.dart';
import '../../res/images.dart';
import '../../res/themes.dart';
import '../../utils.dart';
import '../home/widgets/app_bar_widget.dart';
import 'widgets/app_search_delegate.dart';
import 'widgets/content_widget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Let\'s explore',
          style: AppTextStyle.regular25,
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
        ),
      ],
    );
  }
}

class DictionaryScreen extends StatelessWidget {
  const DictionaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DictionaryProvider>(context);
    return FutureBuilder(
      future: VocabularyService().getAllVocabulary(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var vocabularyList = snapshot.data!;
          return Scaffold(
            appBar: AppBarWidget(
              leading: Padding(
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  AppLogoImage.logo,
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: () => showSearch(
                    context: context,
                    delegate: AppSearchDelegate(
                      dataList: vocabularyList,
                      onItemSelected: provider.handleItemSelected,
                    ),
                  ),
                  child: const CircleAvatar(
                    backgroundColor: AppColors.white,
                    child: Icon(
                      Icons.search_sharp,
                      color: AppColors.black,
                      size: 20,
                    ),
                  ),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: HeaderWidget(),
                  ),
                  const SizedBox(height: 20),
                  ContentWidget(
                    title: 'Gain knowledge',
                    description: 'Explore and learning new vocabularies',
                    image: Image.asset(
                      DictionaryScreenImage.explore,
                      scale: 5,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ContentWidget(
                    title: 'Special tests',
                    description:
                        'Our traing test will help you improve your skill',
                    image: Image.asset(
                      DictionaryScreenImage.skill,
                      scale: 5,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ContentWidget(
                    title: 'Collections',
                    description: 'Add and custom your favorite collections',
                    image: Image.asset(
                      DictionaryScreenImage.user,
                      scale: 5,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const AppLoadingIndicator();
        }
      },
    );
  }
}
