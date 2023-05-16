import 'package:dictionary/utils.dart';
import 'package:flutter/cupertino.dart';
import '../../../res/themes.dart';

class LockContentWidget extends StatelessWidget {
  final Widget lockContent;
  final double width;
  final double height;
  const LockContentWidget({
    super.key,
    required this.lockContent,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        appMessageDialog(
          context: context,
          title: 'Login required',
          message: 'Please login to access this content',
        );
      },
      child: Stack(
        children: [
          lockContent,
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: AppColors.lock,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(
              CupertinoIcons.lock_fill,
              color: AppColors.white,
              size: 50,
            ),
          )
        ],
      ),
    );
  }
}
