import 'package:flutter/material.dart';
import 'res/themes.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
        strokeWidth: 4.0,
        backgroundColor: AppColors.gray,
      ),
    );
  }
}
