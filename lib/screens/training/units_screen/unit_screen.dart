import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:dictionary/res/themes.dart';
import 'package:dictionary/screens/training/widgets/unit_action_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../navigator/widgets/app_bar_widget.dart';
import '../../../res/images.dart';
import '../widgets/unit_item_card.dart';

class UnitScreen extends StatelessWidget {
  const UnitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(screenTitle: 'Unit screen'),
      body: UnitStartScreen(),
    );
  }
}

class UnitSwipeCard extends StatefulWidget {
  const UnitSwipeCard({super.key});

  @override
  State<UnitSwipeCard> createState() => _UnitSwipeCardState();
}

class _UnitSwipeCardState extends State<UnitSwipeCard> {
  final swipableCard = const [
    UnitFlipCard(),
    UnitFlipCard(),
    UnitFlipCard(),
    UnitFlipCard(),
    UnitFlipCard(),
    UnitFlipCard(),
    UnitFlipCard(),
  ];

  final AppinioSwiperController controller = AppinioSwiperController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: SizedBox(
                child: AppinioSwiper(
                  swipeOptions: AppinioSwipeOptions.allDirections,
                  unlimitedUnswipe: true,
                  controller: controller,
                  //unswipe: _unswipe,
                  onSwipe: (index, direction) {},

                  onEnd: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const UnitCongratsScreen(),
                      ),
                    );
                  },
                  cardsCount: swipableCard.length,
                  cardsBuilder: (BuildContext context, int index) {
                    return swipableCard[index];
                  },
                ),
              ),
            ),
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
                      controller;
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
            )
          ],
        ),
      ),
    );
  }
}

class UnitStartScreen extends StatelessWidget {
  const UnitStartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Tutorial",
            style: AppTextStyle.bold25,
          ),
          const SizedBox(height: 30),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Swipe or use the button ',
                  style: AppTextStyle.medium15,
                ),
                TextSpan(
                  text: 'left/right ',
                  style: AppTextStyle.bold15.copyWith(
                    color: AppColors.darkGreen,
                  ),
                ),
                TextSpan(
                  text: 'to pass',
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
                    color: AppColors.darkGreen,
                  ),
                ),
                TextSpan(
                  text: 'to mark vocabulary as favorite',
                  style: AppTextStyle.medium15,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Expanded(
            child: Image(
              image: NetworkImage(
                'https://drive.google.com/uc?export=view&id=11L6utmKKTPr2Zo10CRdTU_mi2iP8Zt2l',
              ),
            ),
          ),
          const SizedBox(height: 30),
          FloatingActionButton.extended(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const UnitSwipeCard(),
                ),
              );
            },
            icon: const Icon(Icons.poll),
            label: Text(
              'Start',
              style: AppTextStyle.medium40,
            ),
          )
        ],
      ),
    );
  }
}

class UnitCongratsScreen extends StatelessWidget {
  const UnitCongratsScreen({
    super.key,
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
              'Congrats! You completed the Unit topic',
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
