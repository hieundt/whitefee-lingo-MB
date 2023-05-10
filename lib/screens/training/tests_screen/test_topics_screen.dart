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

    // final arguments =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    // // Access the passed arguments
    // final photos = arguments?['photos'];
    // final productId = arguments?['sentences'];

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
      body: FutureBuilder(
        future: TestService().getAllTest(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var tests = snapshot.data!;
            return GridView.builder(
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
                    print(tests[index].name);
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
            );
          } else {
            return const AppLoadingIndicator();
          }
        },
      ),
    );
  }
}
