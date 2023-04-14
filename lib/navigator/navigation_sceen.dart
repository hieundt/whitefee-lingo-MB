import 'package:dictionary/navigator/components/app_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../screens/auth/user_screen.dart';
import '../screens/dictionary/dictionary_screen.dart';
import '../screens/training/training_screen.dart';
import '../themes/themes.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({super.key});

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  int pageIndex = 2;

  final pages = [
    const DictionaryScreen(),
    const TrainingScreen(),
    const UserScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Image.network(
                'https://cdn-icons-png.flaticon.com/512/987/987811.png',
                scale: 15,
              ),
              const SizedBox(width: 10),
              Text(
                "Dict pal",
                style: AppTextStyle.medium20.copyWith(
                  color: AppColors.darkGreen,
                ),
              ),
            ],
          ),
          elevation: 0,
          backgroundColor: AppColors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: pages[pageIndex],
        ),
        bottomNavigationBar: const AppNavigationBar(),
      ),
    );
  }
}
