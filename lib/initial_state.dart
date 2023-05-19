// import 'package:flutter/material.dart';
// import 'data/services/user_service.dart';
// import 'screens/auth/login_screen.dart';
// import 'screens/home/home_sceen.dart';
// import 'utils.dart';

// class InitialState extends StatelessWidget {
//   const InitialState({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<String?>(
//         future: UserService().getSavedUserId(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             if (snapshot.hasData) {
//               return const HomeScreen();
//             } else {
//               return const LoginScreen();
//             }
//           } else {
//             return const AppLoadingIndicator();
//           }
//         },
//       ),
//     );
//   }
// }
