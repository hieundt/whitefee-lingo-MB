import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../themes/themes.dart';

class TestsScreen extends StatelessWidget {
  const TestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tests = [
      'Photos',
      'Question - Response',
      'Short conversations',
      'Short talk',
      'Incomplete sentences',
      'Text completion',
      'Reading comprehension',
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
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: tests.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: AppContainerStyle.border.copyWith(
              color: AppColors.white,
            ),
            child: Column(
              children: [
                Image.network(
                  'https://cdn-icons-png.flaticon.com/128/3068/3068553.png',
                ),
                Text(
                  tests[index],
                  style: AppTextStyle.medium20,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
