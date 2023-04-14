import 'package:dictionary/screens/widgets/app_text_fields.dart';
import 'package:dictionary/themes/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Let\'s ',
                style: AppTextStyle.regular25,
              ),
              TextSpan(
                text: 'explore',
                style: AppTextStyle.regular25,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          'something new',
          style: AppTextStyle.bold25.copyWith(
            color: AppColors.transparent,
            shadows: [
              const Shadow(
                offset: Offset(0, -5),
                color: AppColors.darkGreen,
              ),
            ],
            decoration: TextDecoration.underline,
            decorationThickness: 7,
            decorationColor: AppColors.yellow,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class DictionaryScreen extends StatelessWidget {
  const DictionaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const HeaderWidget(),
        const SizedBox(height: 20),
        AppTextFormField(
          hintText: 'Find interesting words',
          prefixIcon: const Icon(CupertinoIcons.search),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: AppContainerStyle.border.copyWith(
            color: AppColors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Word',
                          style: AppTextStyle.medium25,
                        ),
                        Text(
                          'type',
                          style: AppTextStyle.regular15,
                        ),
                        Text(
                          '/phonetics/',
                          style: AppTextStyle.regular15,
                        )
                      ],
                    ),
                  ),
                  const Expanded(
                    child: Icon(
                      CupertinoIcons.speaker_3,
                      size: 40,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Divider(
                thickness: 3,
                indent: 20,
                endIndent: 20,
                color: AppColors.black,
              ),
              const SizedBox(height: 30),
              Image.network(
                'https://cdn-icons-png.flaticon.com/512/384/384998.png',
                scale: 3,
              ),
              const SizedBox(height: 30),
              Text(
                'Meaning',
                style: AppTextStyle.medium25,
              ),
              Text(
                'This is the meaning of the word',
                style: AppTextStyle.regular15,
                overflow: TextOverflow.visible,
              ),
              const SizedBox(height: 30),
              Text(
                'Example',
                style: AppTextStyle.medium25,
              ),
              Text(
                'This is the hint/example of the word',
                style: AppTextStyle.regular15,
                overflow: TextOverflow.visible,
              ),
            ],
          ),
        )
      ],
    );
  }
}
