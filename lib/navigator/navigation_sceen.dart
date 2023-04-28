import 'package:dictionary/navigator/components/app_navigation_bar.dart';
import 'package:dictionary/screens/game/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/navigation_bar_provider.dart';
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
  final pages = [
    const DictionaryScreen(),
    const TrainingScreen(),
    const GameScreen(),
    const UserScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppNavigationBarProvider>(context);
    int pageIndex = provider.currentIndex;
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
          child: pages.elementAt(pageIndex),
        ),
        bottomNavigationBar: AppNavigationBar(
          items: [
            AppNavigationBarItem(icon: CupertinoIcons.house_alt_fill),
            AppNavigationBarItem(icon: CupertinoIcons.create),
            AppNavigationBarItem(icon: CupertinoIcons.rocket_fill),
            AppNavigationBarItem(icon: CupertinoIcons.person_fill),
          ],
          onTap: (changedIndex) {
            provider.currentIndex = changedIndex;
          },
        ),
      ),
    );
  }
}


// BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(CupertinoIcons.house_alt_fill),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(CupertinoIcons.create),
//               label: 'Training',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(CupertinoIcons.rocket_fill),
//               label: 'Game',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(CupertinoIcons.person_fill),
//               label: 'User',
//             ),
//           ],
//           currentIndex: pageIndex,
//           backgroundColor: AppColors.darkGreen,
//           unselectedItemColor: AppColors.white,
//           selectedItemColor: AppColors.black,
//           onTap: (changedIndex) {
//             provider.currentIndex = changedIndex;
//           },
//           // onTap: (changedIndex) => context
//           //     .read<AppNavigationBarProvider>()
//           //     .currentIndex(changedIndex),
//         ),
