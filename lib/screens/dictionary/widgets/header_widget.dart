import 'package:flutter/material.dart';
import '../../../res/themes.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Let\'s explore',
          style: AppTextStyle.regular25,
        ),
        const SizedBox(height: 10),
        Text(
          'something new',
          style: AppTextStyle.bold25.copyWith(
            color: AppColors.transparent,
            shadows: [
              const Shadow(
                offset: Offset(0, -5),
                color: AppColors.darkGreen,
              ),
            ],
            decoration: TextDecoration.underline,
            decorationThickness: 7,
            decorationColor: AppColors.yellow,
          ),
        ),
      ],
    );
  }
}
