import 'package:dictionary/themes/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({super.key});

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 5,
      ),
      padding: const EdgeInsets.all(10),
      decoration: AppContainerStyle.border.copyWith(
        color: AppColors.darkGreen,
        border: Border.all(
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 55,
            width: 80,
            decoration: AppContainerStyle.border.copyWith(
              color: AppColors.yellow,
            ),
            child: const Icon(
              CupertinoIcons.house_alt_fill,
              color: AppColors.black,
              size: 35,
            ),
          ),
          const Icon(
            CupertinoIcons.create,
            color: AppColors.white,
            size: 35,
          ),
          const Icon(
            CupertinoIcons.rocket_fill,
            color: AppColors.white,
            size: 35,
          ),
          const Icon(
            CupertinoIcons.person_fill,
            color: AppColors.white,
            size: 35,
          ),
        ],
      ),
    );
  }
}
