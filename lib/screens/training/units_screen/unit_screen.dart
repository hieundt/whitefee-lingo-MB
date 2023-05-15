import 'package:appinio_swiper/controllers.dart';
import 'package:dictionary/data/services/training_service.dart';
import 'package:dictionary/res/themes.dart';
import 'package:dictionary/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../data/models/unit_models/unit_model.dart';
import '../../../navigator/widgets/app_bar_widget.dart';
import '../../../res/images.dart';
import '../widgets/unit_action_button.dart';
import '../widgets/unit_items.dart';

class UnitScreen extends StatefulWidget {
  final Unit unit;
  const UnitScreen({
    super.key,
    required this.unit,
  });

  @override
  State<UnitScreen> createState() => _UnitScreenState();
}

class _UnitScreenState extends State<UnitScreen> {
  final AppinioSwiperController controller = AppinioSwiperController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(screenTitle: "Unit 1: Daily"),
      body: Column(
        children: [
          FutureBuilder(
              future: UnitService().getVocabularyOfUnit(widget.unit.id!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  var vocabularies = snapshot.data!;
                  return Expanded(
                    flex: 4,
                    child: UnitSwipeableStack(
                      items: vocabularies
                          .map((vocabulary) =>
                              UnitFlipCard(vocabulary: vocabulary))
                          .toList(),
                      controller: controller,
                    ),
                  );
                } else {
                  return const AppLoadingIndicator();
                }
              }),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UnitActionButtron(
                  onPressed: () {
                    controller.swipeLeft();
                  },
                  icon: CupertinoIcons.arrow_turn_up_left,
                  iconColor: AppColors.darkGreen,
                ),
                const SizedBox(width: 20),
                UnitActionButtron(
                  onPressed: () {
                    controller.swipeUp();
                  },
                  icon: CupertinoIcons.bookmark_fill,
                  iconColor: AppColors.darkBrown,
                ),
                const SizedBox(width: 20),
                UnitActionButtron(
                  onPressed: () {
                    controller.swipeRight();
                  },
                  icon: CupertinoIcons.arrow_turn_up_right,
                  iconColor: AppColors.darkGreen,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UnitStartScreen extends StatelessWidget {
  final Unit unit;
  const UnitStartScreen({
    super.key,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: ,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Swipe ',
                      style: AppTextStyle.medium15,
                    ),
                    TextSpan(
                      text: 'left or right ',
                      style: AppTextStyle.bold15.copyWith(
                        color: AppColors.darkRed,
                      ),
                    ),
                    TextSpan(
                      text: 'to switch to new vocabulary',
                      style: AppTextStyle.medium15,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Tap on the ',
                      style: AppTextStyle.medium15,
                    ),
                    TextSpan(
                      text: 'Card ',
                      style: AppTextStyle.bold15.copyWith(
                        color: AppColors.darkRed,
                      ),
                    ),
                    TextSpan(
                      text: 'to see the meaning',
                      style: AppTextStyle.medium15,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Tap on the ',
                      style: AppTextStyle.medium15,
                    ),
                    TextSpan(
                      text: 'bookmark ',
                      style: AppTextStyle.bold15.copyWith(
                        color: AppColors.darkRed,
                      ),
                    ),
                    TextSpan(
                      text: 'to add to favorite list',
                      style: AppTextStyle.medium15,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Image(
                  image: NetworkImage(
                    unit.image!,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              FloatingActionButton.extended(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => UnitScreen(unit: unit),
                    ),
                  );
                },
                icon: const Icon(Icons.poll),
                label: Text(
                  'Start',
                  style: AppTextStyle.medium40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UnitCongratsScreen extends StatelessWidget {
  final String unitName;
  const UnitCongratsScreen({
    super.key,
    required this.unitName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Congrats! You completed unit $unitName topic',
              style: AppTextStyle.bold25,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Divider(
              thickness: 3,
              color: AppColors.black,
            ),
            const SizedBox(height: 30),
            Image.asset(
              AppLogoImage.logo,
              fit: BoxFit.cover,
              scale: 2,
            ),
            const Divider(),
            ElevatedButton.icon(
              style: AppButtonStyle.boder,
              icon: const Icon(CupertinoIcons.checkmark_circle),
              label: const Text(' Mark Complete!'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
