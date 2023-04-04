import 'package:dictionary/screens/widgets/containers.dart';
import 'package:dictionary/screens/widgets/text_fields.dart';
import 'package:dictionary/themes/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DictionaryScreen extends StatelessWidget {
  const DictionaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dictionary',
          style: AppTextStyle.bold40,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          AppTextFormField(
            hintText: 'Find interesting words',
            prefixIcon: const Icon(CupertinoIcons.search),
          ),
        ],
      ),
    );
  }
}
