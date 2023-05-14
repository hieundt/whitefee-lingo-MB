import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../navigator/widgets/app_bar_widget.dart';
import '../../res/themes.dart';

class FavoriteUnitScreen extends StatelessWidget {
  const FavoriteUnitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        screenTitle: 'Favorite Unit',
        titleColor: AppColors.darkBrown,
        leading: Icon(
          CupertinoIcons.square_favorites_alt,
          color: AppColors.darkBrown,
        ),
      ),
      body: ListView(),
    );
  }
}
