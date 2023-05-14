import 'package:dictionary/navigator/widgets/app_bar_widget.dart';
import 'package:dictionary/res/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestHistoryScreen extends StatelessWidget {
  const TestHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        screenTitle: 'Test history',
        titleColor: AppColors.darkBrown,
        leading: Icon(
          CupertinoIcons.hourglass,
          color: AppColors.darkBrown,
        ),
      ),
      body: ListView(),
    );
  }
}
