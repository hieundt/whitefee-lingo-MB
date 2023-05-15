import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import '../../../res/themes.dart';
import '../../dictionary/widgets/pronounce_widget.dart';

class UnitFlipCard extends StatelessWidget {
  const UnitFlipCard({super.key});

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
              'sunset',
              style: AppTextStyle.bold40,
            ),
            Text(
              'noun',
              style: AppTextStyle.regular25,
            ),
            Text(
              "ˈsʌn.set",
              style: AppTextStyle.phonetics.copyWith(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'hint',
              style: AppTextStyle.regular25,
              overflow: TextOverflow.clip,
            ),
            Text(
              'We sat on the beach watching a spectacular sunset',
              style: AppTextStyle.medium20,
              overflow: TextOverflow.clip,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://drive.google.com/uc?export=view&id=1rOY1PYJkIxzo-r3fO6Nic9ArihBrt22T',
                  scale: 3,
                ),
                const PronounceWidget(
                  url:
                      'https://drive.google.com/uc?export=view&id=1BjoSz1EGXWxLnbc8Uk9eV3ebOEOEDSfA',
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              'the time in the evening when you last see the sun in the sky',
              style: AppTextStyle.medium20,
            ),
          ],
        ),
      ),
    );
  }
}
