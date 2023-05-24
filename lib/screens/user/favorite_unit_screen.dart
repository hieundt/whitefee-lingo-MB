import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data/services/training_service.dart';
import '../../data/services/user_service.dart';
import '../../main.dart';
import '../../res/themes.dart';
import '../../utils.dart';
import '../home/widgets/app_bar_widget.dart';

class FavoriteUnitScreen extends StatelessWidget {
  const FavoriteUnitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        screenTitle: 'Favorite Unit',
        titleColor: AppColors.darkBrown,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: FutureBuilder(
        future: UserFavoriteCollectionService().getFavoriteUnit(
          prefs.getString('userId')!,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var favorite = snapshot.data!;
            return favorite.isNotEmpty
                ? ListView.separated(
                    padding: const EdgeInsets.all(10),
                    itemCount: favorite.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 20);
                    },
                    itemBuilder: (context, index) => FavoriteUnitWidget(
                      unitId: favorite[index].unitId!,
                    ),
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          CupertinoIcons.square_favorites_alt,
                          color: AppColors.black,
                          size: 50,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Your favorites list is empty',
                          style: AppTextStyle.medium20,
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Tap on the ',
                                  style: AppTextStyle.medium15.copyWith(
                                    color: AppColors.darkGrey,
                                  ),
                                ),
                                const WidgetSpan(
                                  child: Icon(
                                    CupertinoIcons.heart,
                                    color: AppColors.darkGrey,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      ' icon of your favorite unit topic to show them here',
                                  style: AppTextStyle.medium15.copyWith(
                                    color: AppColors.darkGrey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
          } else {
            return const AppLoadingIndicator();
          }
        },
      ),
    );
  }
}

class FavoriteUnitWidget extends StatelessWidget {
  final String unitId;
  const FavoriteUnitWidget({
    super.key,
    required this.unitId,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UnitService().getUnitById(unitId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var unit = snapshot.data!;
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
                    unit.image!,
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(width: 30),
                  Text(
                    unit.name!,
                    style: AppTextStyle.medium40,
                  ),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
