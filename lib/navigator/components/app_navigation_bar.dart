import 'dart:collection';

import 'package:dictionary/providers/navigation_bar_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../themes/themes.dart';

class AppNavivationBarItem extends StatelessWidget {
  final IconData icon;
  final bool? active;
  final Function? onPressed;

  const AppNavivationBarItem({
    super.key,
    required this.icon,
    this.active,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({super.key});

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
