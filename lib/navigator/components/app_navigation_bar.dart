import 'package:dictionary/providers/navigation_bar_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../themes/themes.dart';

class AppNavigationBarItem {
  final IconData icon;

  AppNavigationBarItem({
    required this.icon,
  });
}

class AppNavigationBar extends StatefulWidget {
  final List<AppNavigationBarItem> items;
  final ValueChanged<int>? onTap;

  const AppNavigationBar({
    super.key,
    required this.items,
    this.onTap,
  });

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppNavigationBarProvider>(context);
    var enable = provider.enable;
    var currentIndex = provider.currentIndex;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: AppContainerStyle.border.copyWith(
        color: AppColors.darkGreen,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: widget.items.map(
          (item) {
            return GestureDetector(
              onTap: () {
                if (!enable) {
                  return;
                } else {
                  currentIndex = widget.items.indexOf(item);
                  enable = false;
                }
                widget.onTap?.call(currentIndex);
              },
              child: widget.items.indexOf(item) == currentIndex
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 15,
                      ),
                      decoration: AppContainerStyle.border.copyWith(
                        color: AppColors.yellow,
                      ),
                      child: Icon(
                        item.icon,
                        color: AppColors.black,
                        size: 50,
                      ),
                    )
                  : Icon(
                      item.icon,
                      color: AppColors.white,
                      size: 50,
                    ),
            );
          },
        ).toList(),
      ),
    );
  }
}
