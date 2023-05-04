import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../res/images.dart';
import '../../../res/themes.dart';

class TestsScreen extends StatelessWidget {
  const TestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final testNames = [
      'Photos',
      'Ques - Res',
      'Conversations',
      'Short Talk',
      'Sentences',
      'Complete Text',
      'Reading',
    ];

    final image = [
      TestScreenImage.reading,
      TestScreenImage.quesRes,
      TestScreenImage.conversations,
      TestScreenImage.talk,
      TestScreenImage.reading,
      TestScreenImage.text,
      TestScreenImage.reading,
    ];

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              decoration: AppContainerStyle.border.copyWith(
                color: AppColors.red,
              ),
              child: const Icon(
                CupertinoIcons.xmark,
                color: AppColors.black,
              ),
            ),
          ),
        ),
        title: Text(
          'Secret Englist ingredient',
          style: AppTextStyle.bold15,
        ),
        elevation: 0,
        backgroundColor: AppColors.transparent,
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
        ),
        itemCount: testNames.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              decoration: AppContainerStyle.border.copyWith(
                color: AppColors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    image[index],
                    width: 100,
                    height: 60,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    testNames[index],
                    style: AppTextStyle.medium15,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
