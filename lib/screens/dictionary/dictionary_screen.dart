import 'package:dictionary/screens/dictionary/widgets/search_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/dictionary_provider.dart';
import '../../res/themes.dart';
import '../auth/widgets/app_text_fields.dart';

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

class DictionaryScreen extends StatefulWidget {
  const DictionaryScreen({super.key});

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  @override
  Widget build(BuildContext context) {
    //var provider = Provider.of<DictionaryProvider>(context);
    //void updateList(String value) {}

    return ListView(
      children: [
        const HeaderWidget(),
        const SizedBox(height: 20),
        // DictionarySearchBar(
        //   hintText: 'Find interesting words',
        // ),
        const SizedBox(height: 10),
      ],
    );
  }
}
