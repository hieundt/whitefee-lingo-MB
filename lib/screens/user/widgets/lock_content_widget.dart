import 'package:flutter/cupertino.dart';
import '../../../main.dart';
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
    return Stack(
      children: [
        lockContent,
        prefs.getString('userId') == null
            ? Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: AppColors.lock,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      CupertinoIcons.lock_fill,
                      color: AppColors.white,
                      size: 50,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Login required',
                      style: AppTextStyle.medium15.copyWith(
                        color: AppColors.white,
                      ),
                    )
                  ],
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
