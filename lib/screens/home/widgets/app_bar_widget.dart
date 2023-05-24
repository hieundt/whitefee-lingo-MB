import 'package:flutter/material.dart';
import '../../../res/themes.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String screenTitle;
  final Color? titleColor;
  final Widget? leading;
  final List<Widget>? actions;
  const AppBarWidget({
    super.key,
    this.screenTitle = 'Dictionary Pal',
    this.leading,
    this.titleColor = AppColors.darkGreen,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: Text(
        screenTitle,
        style: AppTextStyle.medium20.copyWith(
          color: titleColor,
        ),
      ),
      elevation: 0,
      backgroundColor: AppColors.transparent,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
