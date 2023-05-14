import 'package:dictionary/data/services/training_service.dart';
import 'package:dictionary/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../res/images.dart';
import '../../../res/themes.dart';
import 'test_screen.dart';

class TestTopicsScreen extends StatelessWidget {
  const TestTopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final testNames = [
      'Ques - Res',
      'Conversations',
      'Short Talk',
      'Complete Text',
      'Reading',
    ];

    final image = [
      TestScreenImage.quesRes,
      TestScreenImage.conversations,
      TestScreenImage.talk,
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
          'Secret English ingredient',
          style: AppTextStyle.bold15,
        ),
        elevation: 0,
        backgroundColor: AppColors.transparent,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: TestService().getAllTest(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var tests = snapshot.data!;
            return ListView(
              children: [
                //Real data
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: tests.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => TestScreen(
                              test: tests[index],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: AppContainerStyle.border.copyWith(
                          color: AppColors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(
                              tests[index].image!,
                              width: 100,
                              height: 60,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              tests[index].name!,
                              style: AppTextStyle.medium15,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                //Only Ui
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: testNames.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        appMessageDialog(
                          context,
                          'This content will be developed in the future, stay tuned! ',
                        );
                      },
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
              ],
            );
          } else {
            return const AppLoadingIndicator();
          }
        },
      ),
    );
  }
}
