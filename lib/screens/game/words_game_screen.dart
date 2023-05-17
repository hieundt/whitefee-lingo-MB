import 'package:dictionary/data/models/vocabulary_model/vocabulary_model.dart';
import 'package:dictionary/data/services/training_service.dart';
import 'package:dictionary/data/services/user_service.dart';
import 'package:dictionary/data/services/vocabulary_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../res/themes.dart';

class WordsGameScreen extends StatelessWidget {
  const WordsGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<AuthProvider>(context).currentUser;
    return Center(
      child: GestureDetector(
        onTap: () async {
          print('tapped');
          var voca = await UnitService()
              .getVocabularyOfUnit('6453772d7029627e8fd9dcac');

          print(voca[1]!.word);
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

class Fake extends StatelessWidget {
  final Widget child;
  const Fake({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<AuthProvider>(context).currentUser;
    return Container(
      color: userProvider?.id == null ? null : AppColors.dark,
      child: child,
    );
  }
}
