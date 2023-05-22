import 'package:flutter/material.dart';

import '../../../res/themes.dart';

class SearchBar extends StatelessWidget {
  final void Function()? onTap;
  const SearchBar({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: AppContainerStyle.border.copyWith(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            const Icon(Icons.search),
            Text(
              ' Find some interesting vocabulary',
              style: AppTextStyle.regular13,
            )
          ],
        ),
      ),
    );
  }
}
