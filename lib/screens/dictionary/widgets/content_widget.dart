import 'package:flutter/material.dart';
import '../../../res/themes.dart';

class ContentWidget extends StatelessWidget {
  final String title;
  final String description;
  final Widget image;
  const ContentWidget({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: AppContainerStyle.border.copyWith(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: image,
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.bold15,
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: AppTextStyle.regular13,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
