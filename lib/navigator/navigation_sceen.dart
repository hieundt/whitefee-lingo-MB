import 'package:dictionary/navigator/widgets/app_bar_widget.dart';
import 'package:dictionary/navigator/widgets/app_navigation_bar.dart';
import 'package:dictionary/res/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/navigation_bar_provider.dart';
import '../screens/user/user_screen.dart';
import '../screens/dictionary/dictionary_screen.dart';
import '../screens/game/words_game_screen.dart';
import '../screens/training/training_screen.dart';
import '../res/themes.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final pages = [
    const DictionaryScreen(),
    const TrainingScreen(),
    const WordsGameScreen(),
    const UserScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppNavigationBarProvider>(context);
    int pageIndex = provider.currentIndex;

    return SafeArea(
      child: Scaffold(
        appBar: const AppBarWidget(),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: pages.elementAt(pageIndex),
        ),
        bottomNavigationBar: AppNavigationBar(
          items: [
            AppNavigationBarItem(icon: CupertinoIcons.house_alt_fill),
            AppNavigationBarItem(icon: CupertinoIcons.create),
            AppNavigationBarItem(icon: CupertinoIcons.rocket_fill),
            AppNavigationBarItem(icon: CupertinoIcons.person_fill),
          ],
          currentIndex: pageIndex,
          onTap: (changedIndex) {
            provider.currentIndex = changedIndex;
          },
        ),
      ),
    );
  }
}
