import 'package:dictionary/themes/themes.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget label;
  final Widget? icon;
  final Color? backgroundColor;
  final ButtonStyle? style;

  factory AppButton({
    required void Function() onPressed,
    required Widget label,
    Widget? icon,
    Color? backgroundColor = AppColors.base,
    ButtonStyle? style,
  }) {
    return AppButton._internal(
      onPressed: onPressed,
      label: label,
      icon: icon,
      backgroundColor: backgroundColor,
      style: style,
    );
  }

  const AppButton._internal({
    required this.onPressed,
    required this.label,
    this.icon,
    this.backgroundColor,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: SizedBox(child: icon),
      label: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          bottom: 15,
        ),
        child: label,
      ),
      style: style ??
          ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            side: const BorderSide(
              width: 3,
              color: AppColors.black,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
    );
  }
}
