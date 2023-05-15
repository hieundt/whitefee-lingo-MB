import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:dictionary/data/models/vocabulary_model/vocabulary_model.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import '../../../res/themes.dart';
import '../../dictionary/widgets/pronounce_widget.dart';
import '../units_screen/unit_screen.dart';

class UnitFlipCard extends StatelessWidget {
  final Vocabulary vocabulary;
  const UnitFlipCard({
    super.key,
    required this.vocabulary,
  });

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      front: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: AppContainerStyle.border.copyWith(
          color: AppColors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              vocabulary.word!,
              style: AppTextStyle.bold40.copyWith(
                color: AppColors.darkBrown,
              ),
            ),
            Text(
              vocabulary.type!,
              style: AppTextStyle.medium15,
            ),
            Text(
              vocabulary.phonetics!,
              style: AppTextStyle.phonetics.copyWith(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Hint: ',
                    style: AppTextStyle.bold15.copyWith(
                      color: AppColors.darkGreen,
                    ),
                  ),
                  TextSpan(
                    text: vocabulary.hint,
                    style: AppTextStyle.regular13,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      back: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: AppContainerStyle.border.copyWith(
          color: AppColors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(
                  vocabulary.image!,
                  scale: 3,
                ),
                PronounceWidget(
                  url: vocabulary.pronounce!,
                ),
              ],
            ),
            const SizedBox(height: 30),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Meaning: ',
                    style: AppTextStyle.bold15.copyWith(
                      color: AppColors.darkGreen,
                    ),
                  ),
                  TextSpan(
                    text: vocabulary.meaning,
                    style: AppTextStyle.regular13,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UnitSwipeableStack extends StatelessWidget {
  final List<Widget> items;

  final AppinioSwiperController controller;
  const UnitSwipeableStack({
    super.key,
    required this.items,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  const UnitCongratsScreen(unitName: 'Daily'),
            ),
          );
        },
        cardsCount: items.length,
        cardsBuilder: (BuildContext context, int index) {
          return items[index];
        },
      ),
    );
  }
}
