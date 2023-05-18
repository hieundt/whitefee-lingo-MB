import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data/services/training_service.dart';
import '../../res/themes.dart';
import '../../utils.dart';
import '../home/widgets/app_bar_widget.dart';

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
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          favorite.image!,
                          width: 100,
                          height: 100,
                        ),
                        const SizedBox(width: 30),
                        Text(
                          favorite.name!,
                          style: AppTextStyle.medium40,
                        ),
                      ],
                    ),
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
