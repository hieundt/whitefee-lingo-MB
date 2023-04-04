import 'package:dictionary/themes/themes.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  final Widget? childWidget;
  final Color? background;

  factory AppContainer({
    Widget? childWidget,
    Color? background = AppColors.base,
  }) {
    return AppContainer._internal(
      childWidget: childWidget,
      background: background,
    );
  }

  const AppContainer._internal({
    this.childWidget,
    this.background,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: background,
        border: Border.all(
          color: AppColors.black,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: childWidget,
    );
  }
}

class AppHorizontalContainer extends StatelessWidget {
  final String leadingTitle;
  final String title;
  final String description;
  final Widget image;
  final String progressValue;
  final String progressTitle;
  final String? scoreValue;
  final String? scoreTitle;
  final Color? mainColor;
  final Color? leadingColor;
  final Color? leadingTitleColor;

  factory AppHorizontalContainer({
    required String contentName,
    required String title,
    required String description,
    required Widget image,
    required String progressValue,
    required String progressTitle,
    String? scoreValue,
    String? scoreTitle,
    Color? mainColor = AppColors.base,
    Color? leadingColor = AppColors.base,
    Color? leadingTitleColor = AppColors.black,
  }) {
    return AppHorizontalContainer._internal(
      leadingTitle: contentName,
      title: title,
      description: description,
      image: image,
      progressValue: progressValue,
      progressTitle: progressTitle,
      scoreValue: scoreValue,
      scoreTitle: scoreTitle,
      mainColor: mainColor,
      leadingColor: leadingColor,
      leadingTitleColor: leadingTitleColor,
    );
  }

  const AppHorizontalContainer._internal({
    required this.leadingTitle,
    required this.title,
    required this.description,
    required this.image,
    required this.progressValue,
    required this.progressTitle,
    this.scoreValue,
    this.scoreTitle,
    this.mainColor,
    this.leadingColor,
    this.leadingTitleColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: mainColor,
                border: Border.all(
                  color: AppColors.black,
                  width: 2,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                color: leadingColor,
                                border: Border.all(
                                  color: AppColors.black,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                leadingTitle,
                                style: AppTextStyle.regular15.copyWith(
                                  color: leadingTitleColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              title,
                              style: AppTextStyle.bold25,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              description,
                              style: AppTextStyle.regular15,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: image,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(
                  color: AppColors.black,
                  width: 2,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          progressValue,
                          style: AppTextStyle.bold25,
                        ),
                        Text(
                          progressTitle,
                          style: AppTextStyle.regular15,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          scoreValue ?? '',
                          style: AppTextStyle.bold25,
                        ),
                        Text(
                          scoreTitle ?? '',
                          style: AppTextStyle.regular15,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
