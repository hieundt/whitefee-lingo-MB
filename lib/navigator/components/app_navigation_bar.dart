import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../themes/themes.dart';

class AppNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;
  const AppNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.house_fill),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.group_solid),
          label: 'Comunity',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.doc_checkmark_fill),
          label: 'Game center',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.create),
          label: 'Grammar',
        ),
      ],
      currentIndex: selectedIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: AppColors.white,
      selectedItemColor: AppColors.yellow,
    );
  }
}
