// ignore_for_file: avoid_print
import 'package:dictionary/data/services/training_service.dart';
import 'package:flutter/material.dart';
import '../../res/themes.dart';

class WordsGameScreen extends StatelessWidget {
  const WordsGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () async {
          print('tapped');
          var result = await TestService().getAllTest();
          print(result[0].questions);
        },
        child: Container(
          width: 65,
          decoration: AppContainerStyle.border.copyWith(
            color: AppColors.yellow,
          ),
          child: const Icon(
            Icons.home_filled,
            color: AppColors.black,
            size: 35,
          ),
        ),
      ),
    );
  }
}
