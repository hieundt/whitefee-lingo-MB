import 'dart:collection';

import 'package:dictionary/providers/navigation_bar_provider.dart';
import 'package:flutter/cupertino.dart';
import '../../themes/themes.dart';

// class AppNavigationBar2 extends StatefulWidget {
//   const AppNavigationBar2({super.key});

//   @override
//   State<AppNavigationBar2> createState() => _AppNavigationBar2State();
// }

// class _AppNavigationBar2State extends State<AppNavigationBar2> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 80,
//       margin: const EdgeInsets.only(
//         left: 10,
//         right: 10,
//         bottom: 5,
//       ),
//       padding: const EdgeInsets.all(10),
//       decoration: AppContainerStyle.border.copyWith(
//         color: AppColors.darkGreen,
//         border: Border.all(
//           width: 2,
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             height: 55,
//             width: 80,
//             decoration: AppContainerStyle.border.copyWith(
//               color: AppColors.yellow,
//             ),
//             child: const Icon(
//               CupertinoIcons.house_alt_fill,
//               color: AppColors.black,
//               size: 35,
//             ),
//           ),
//           const Icon(
//             CupertinoIcons.create,
//             color: AppColors.white,
//             size: 35,
//           ),
//           const Icon(
//             CupertinoIcons.rocket_fill,
//             color: AppColors.white,
//             size: 35,
//           ),
//           const Icon(
//             CupertinoIcons.person_fill,
//             color: AppColors.white,
//             size: 35,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class AppNavigationBar extends StatelessWidget {
//   final IconData item;
//   final UnmodifiableListView<AppNavigationBarItem> items;
//   const AppNavigationBar({
//     super.key,
//     required this.item,
//     required this.items,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 80,
//       margin: const EdgeInsets.only(
//         left: 10,
//         right: 10,
//         bottom: 5,
//       ),
//       padding: const EdgeInsets.all(10),
//       decoration: AppContainerStyle.border.copyWith(
//         color: AppColors.darkGreen,
//         border: Border.all(
//           width: 2,
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: items.map(
//           (item) {
//             return item.isActive
//                 ? Container(
//                     height: 55,
//                     width: 80,
//                     decoration: AppContainerStyle.border.copyWith(
//                       color: AppColors.yellow,
//                     ),
//                     child: Icon(
//                       item.icon,
//                       color: AppColors.black,
//                       size: 35,
//                     ),
//                   )
//                 : Icon(
//                     item.icon,
//                     color: AppColors.white,
//                     size: 35,
//                   );
//           },
//         ).toList(),
//       ),
//     );
//   }
// }

// class NavBar extends StatefulWidget {
//   final int currentIndex;
//   final List<IconData> items;
//   final void Function(int)? onTap;
//   const NavBar({
//     super.key,
//     this.currentIndex = 0,
//     required this.items,
//     required this.onTap,
//   });

//   @override
//   State<NavBar> createState() => _NavBarState();
// }

// class _NavBarState extends State<NavBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 80,
//       margin: const EdgeInsets.only(
//         left: 10,
//         right: 10,
//         bottom: 5,
//       ),
//       padding: const EdgeInsets.all(10),
//       decoration: AppContainerStyle.border.copyWith(
//         color: AppColors.darkGreen,
//         border: Border.all(
//           width: 2,
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: widget.items.map(
//           (item) {
//             return widget.currentIndex == widget.items[currentIndex]
//                 ? Container(
//                     height: 55,
//                     width: 80,
//                     decoration: AppContainerStyle.border.copyWith(
//                       color: AppColors.yellow,
//                     ),
//                     child: Icon(
//                       item,
//                       color: AppColors.black,
//                       size: 35,
//                     ),
//                   )
//                 : Icon(
//                     item,
//                     color: AppColors.white,
//                     size: 35,
//                   );
//           },
//         ).toList(),
//       ),
//     );
//   }
// }
