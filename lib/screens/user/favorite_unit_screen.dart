import 'package:dictionary/data/services/training_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../home/widgets/app_bar_widget.dart';
import '../../res/themes.dart';
import '../../utils.dart';

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
      body: FutureBuilder(
        future: UnitService().getUnitByName('Daily'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var favorite = snapshot.data!;
            return ListView.separated(
              padding: const EdgeInsets.all(10),
              itemCount: 10,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 20);
              },
              itemBuilder: (context, index) {
                return Container(
                  decoration: AppContainerStyle.border.copyWith(
                    color: AppColors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        favorite.image!,
                        width: 100,
                        height: 60,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        favorite.name!,
                        style: AppTextStyle.medium15,
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const AppLoadingIndicator();
          }
        },
      ),
    );
  }
}
