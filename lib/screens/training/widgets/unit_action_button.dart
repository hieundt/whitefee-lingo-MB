import 'package:flutter/material.dart';
import '../../../res/themes.dart';

class UnitActionButtron extends StatelessWidget {
  final void Function() onPressed;
  final IconData icon;
  final Color iconColor;

  const UnitActionButtron({
    super.key,
    required this.onPressed,
    required this.icon,
    this.iconColor = AppColors.base,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.white,
        elevation: 5,
        fixedSize: const Size(70, 70),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Icon(
        icon,
        size: 35,
        color: iconColor,
      ),
    );
  }
}
