import 'package:flutter/material.dart';
import '../../main.dart';
import '../../res/images.dart';
import '../../res/themes.dart';
import '../../routes.dart';
import '../home/widgets/app_bar_widget.dart';
import '../user/widgets/lock_content_widget.dart';
import 'widgets/training_topic_widget.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String getTime() {
      var hour = DateTime.now().hour;
      if (hour < 12) {
        return 'Morning,';
      }
      if (hour < 17) {
        return 'Afternoon,';
      }
      return 'Evening,';
    }

    return Column(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Good ',
                style: AppTextStyle.medium25,
              ),
              TextSpan(
                text: getTime(),
                style: AppTextStyle.regular25,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        prefs.getString('userId') != null
            ? Text(
                prefs.getString('userName')!.capitalize(),
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
                textAlign: TextAlign.center,
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: Image.asset(
            AppLogoImage.logo,
          ),
        ),
      ),
      body: ListView(
        children: [
          const GreetingWidget(),
          const SizedBox(height: 20),
          LockContentWidget(
            width: 400,
            height: 300,
            lockContent: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.unitTopics);
              },
              child: TrainingTopicWidget(
                contentName: 'Training',
                title: 'Unit',
                description: 'Learn new vocabulary pronunciation',
                image: Image.asset(
                  TrainingScreenImage.unit,
                ),
                mainColor: AppColors.lightGreen,
                leadingColor: AppColors.darkGreen,
                leadingTitleColor: AppColors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          LockContentWidget(
            width: 400,
            height: 300,
            lockContent: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.testTopics);
              },
              child: TrainingTopicWidget(
                contentName: 'Training',
                title: 'Test',
                description: 'Our test simulator will help you!',
                image: Image.asset(
                  TrainingScreenImage.test,
                ),
                mainColor: AppColors.lightRed,
                leadingColor: AppColors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
