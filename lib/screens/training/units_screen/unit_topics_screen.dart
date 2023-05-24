import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../data/services/training_service.dart';
import '../../../main.dart';
import '../../../res/images.dart';
import '../../../res/themes.dart';
import '../../../utils.dart';
import '../widgets/unit_favorite_marker.dart';
import 'unit_screen.dart';

class UnitTopicsScreen extends StatelessWidget {
  const UnitTopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final unitNames = [
      'Education',
      'Travel',
      'Technology',
      'Health',
    ];

    final image = [
      UnitScreenImgae.education,
      UnitScreenImgae.travel,
      UnitScreenImgae.tech,
      UnitScreenImgae.health,
    ];

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              decoration: AppContainerStyle.border.copyWith(
                color: AppColors.red,
              ),
              child: const Icon(
                CupertinoIcons.xmark,
                color: AppColors.black,
              ),
            ),
          ),
        ),
        title: Text(
          'Better than yesterday!',
          style: AppTextStyle.bold15,
        ),
        elevation: 0,
        backgroundColor: AppColors.transparent,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: UnitService().getUnitByName('Daily'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var unit = snapshot.data!;
            return GridView(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
              ),
              children: [
                //Real data
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            UnitStartScreen(unit: unit),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: AppContainerStyle.border.copyWith(
                      color: AppColors.white,
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: UnitFavoriteMarker(
                            userId: prefs.getString('userId')!,
                            unitId: unit.id!,
                          ),
                        ),
                        Image.network(
                          fit: BoxFit.cover,
                          unit.image!,
                          width: 100,
                          height: 60,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          unit.name!,
                          style: AppTextStyle.medium15,
                        ),
                      ],
                    ),
                  ),
                ),

                //Only Ui
                GestureDetector(
                  onTap: () async {
                    appMessageDialog(
                      context: context,
                      title: 'Comming soon',
                      message:
                          'This content will be developed in the future, stay tuned! ',
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: AppContainerStyle.border.copyWith(
                      color: AppColors.white,
                    ),
                    child: Column(
                      children: [
                        const HeartWidget(),
                        Image.asset(
                          image[0],
                          width: 100,
                          height: 60,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          unitNames[0],
                          style: AppTextStyle.medium15,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    appMessageDialog(
                      context: context,
                      title: 'Comming soon',
                      message:
                          'This content will be developed in the future, stay tuned! ',
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: AppContainerStyle.border.copyWith(
                      color: AppColors.white,
                    ),
                    child: Column(
                      children: [
                        const HeartWidget(),
                        Image.asset(
                          image[1],
                          width: 100,
                          height: 60,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          unitNames[1],
                          style: AppTextStyle.medium15,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    appMessageDialog(
                      context: context,
                      title: 'Comming soon',
                      message:
                          'This content will be developed in the future, stay tuned! ',
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: AppContainerStyle.border.copyWith(
                      color: AppColors.white,
                    ),
                    child: Column(
                      children: [
                        const HeartWidget(),
                        Image.asset(
                          image[2],
                          width: 100,
                          height: 60,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          unitNames[2],
                          style: AppTextStyle.medium15,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    appMessageDialog(
                      context: context,
                      title: 'Comming soon',
                      message:
                          'This content will be developed in the future, stay tuned! ',
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: AppContainerStyle.border.copyWith(
                      color: AppColors.white,
                    ),
                    child: Column(
                      children: [
                        const HeartWidget(),
                        Image.asset(
                          image[3],
                          width: 100,
                          height: 60,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          unitNames[3],
                          style: AppTextStyle.medium15,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const AppLoadingIndicator();
          }
        },
      ),
    );
  }
}

class HeartWidget extends StatelessWidget {
  const HeartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: SizedBox.fromSize(
        size: const Size(50, 50),
        child: const Icon(
          CupertinoIcons.heart,
          size: 30,
          color: AppColors.black,
        ),
      ),
    );
  }
}
