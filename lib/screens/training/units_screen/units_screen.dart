import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../themes/themes.dart';

class UnitsScreen extends StatelessWidget {
  const UnitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Text('Unit Screen'),
    );
  }
}
