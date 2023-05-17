import 'package:dictionary/screens/home/widgets/app_bar_widget.dart';
import 'package:dictionary/screens/home/widgets/app_navigation_bar.dart';
import 'package:dictionary/res/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/navigation_bar_provider.dart';
import '../user/user_screen.dart';
import '../dictionary/dictionary_screen.dart';
import '../game/words_game_screen.dart';
import '../training/training_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
