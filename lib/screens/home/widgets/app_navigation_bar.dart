import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../res/themes.dart';

class AppNavigationBarItem {
  final IconData icon;

  AppNavigationBarItem({
    required this.icon,
  });
}

class AppNavigationBar extends StatelessWidget {
  final List<AppNavigationBarItem> items;
  final int currentIndex;
  final Function(int)? onTap;

  const AppNavigationBar({
    super.key,
    required this.items,
    this.currentIndex = 0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ),
      height: 65,
      decoration: AppContainerStyle.border.copyWith(
        color: AppColors.darkGreen,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map(
          (item) {
            return GestureDetector(
              onTap: () => onTap?.call(items.indexOf(item)),
              child: items.indexOf(item) == currentIndex
                  ? Container(
                      width: 65,
                      decoration: AppContainerStyle.border.copyWith(
                        color: AppColors.yellow,
                      ),
                      child: Icon(
                        item.icon,
                        color: AppColors.black,
                        size: 35,
                      ),
                    )
                  : Icon(
                      item.icon,
                      color: AppColors.white,
                      size: 35,
                    ),
            );
          },
        ).toList(),
      ),
    );
  }
}
