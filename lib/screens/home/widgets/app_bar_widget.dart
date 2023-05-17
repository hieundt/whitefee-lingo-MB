import 'package:flutter/material.dart';

import '../../../res/images.dart';
import '../../../res/themes.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String screenTitle;
  final Color? titleColor;
  final Widget? leading;
  const AppBarWidget({
    super.key,
    this.screenTitle = 'Dictionary Pal',
    this.leading,
    this.titleColor = AppColors.darkGreen,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          leading ??
              Image.asset(
                AppLogoImage.logo,
                scale: 15,
              ),
          const SizedBox(width: 10),
          Text(
            screenTitle,
            style: AppTextStyle.medium20.copyWith(
              color: titleColor,
            ),
          ),
        ],
      ),
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
