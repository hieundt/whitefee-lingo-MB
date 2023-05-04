import 'package:dictionary/res/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../res/themes.dart';

class UnitsScreen extends StatelessWidget {
  const UnitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final unitNames = [
      'Education',
      'Travel',
      'Daily',
      'Technology',
      'Health',
    ];

    final image = [
      UnitScreenImgae.education,
      UnitScreenImgae.education,
      UnitScreenImgae.travel,
      UnitScreenImgae.tech,
      UnitScreenImgae.health,
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
          'Better than yesterday!',
          style: AppTextStyle.bold15,
        ),
        elevation: 0,
        backgroundColor: AppColors.transparent,
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
        ),
        itemCount: unitNames.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
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
                    unitNames[index],
                    style: AppTextStyle.medium15,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
