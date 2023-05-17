import 'package:dictionary/screens/home/widgets/app_bar_widget.dart';
import 'package:dictionary/res/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          alignment: Alignment.topCenter,
          height: 150,
          decoration: AppContainerStyle.border.copyWith(
            color: AppColors.darkBrown,
          ),
          child: Text(
            'Test date: 16/05/2023',
            style: AppTextStyle.bold25.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          height: 100,
          decoration: AppContainerStyle.border.copyWith(
            color: AppColors.white,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Test topic: Photos',
                style: AppTextStyle.medium20,
              ),
              Text(
                'Total point: 356',
                style: AppTextStyle.medium20.copyWith(
                  color: AppColors.gray,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

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
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: 5,
        separatorBuilder: (context, index) {
          return const SizedBox(height: 20);
        },
        itemBuilder: (context, index) {
          return const HistoryWidget();
        },
      ),
    );
  }
}
