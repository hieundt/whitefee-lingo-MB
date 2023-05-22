import 'package:flutter/material.dart';
import '../../../res/themes.dart';

class InformationWidget extends StatelessWidget {
  final Icon? leading;
  final String? title;
  final String? subtitle;
  final Widget? trailing;

  const InformationWidget({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: false,
      leading: leading,
      title: Text(
        title ?? '',
        style: AppTextStyle.regular15.copyWith(
          color: AppColors.darkGrey,
        ),
      ),
      subtitle: Text(
        subtitle ?? '',
        style: AppTextStyle.medium15,
      ),
      trailing: trailing,
      minLeadingWidth: 0,
    );
  }
}

class FavoriteWidget extends StatelessWidget {
  final Icon? leading;
  final String? title;
  final String? subtitle;
  final Widget? trailing;
  final void Function()? onTap;
  const FavoriteWidget({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.lightRed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        splashColor: AppColors.grey,
        child: ListTile(
          dense: true,
          leading: leading,
          title: Text(
            title ?? '',
            style: AppTextStyle.medium15,
          ),
          subtitle: Text(
            subtitle ?? '',
            style: AppTextStyle.regular15,
          ),
          trailing: trailing,
          minLeadingWidth: 0,
        ),
      ),
    );
  }
}
