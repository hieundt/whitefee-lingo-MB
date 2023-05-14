import 'package:dictionary/data/services/training_service.dart';
import 'package:dictionary/data/services/user_service.dart';
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
          var object = await TestService()
              .getAllQuestionOfTest('6453610e7029627e8fd9dc91');
          print(object[0].options.toString());
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
