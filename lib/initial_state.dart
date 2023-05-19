import 'package:dictionary/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/services/user_service.dart';
import 'screens/auth/login_screen.dart';
import 'screens/home/home_sceen.dart';
import 'utils.dart';

class InitialState extends StatefulWidget {
  const InitialState({super.key});

  @override
  State<InitialState> createState() => _InitialStateState();
}

class _InitialStateState extends State<InitialState> {
  @override
  Widget build(BuildContext context) {
    //var userProvider = Provider.of<UserProvider>(context).currentUserId;
    return Scaffold(
      body: FutureBuilder<String?>(
        future: UserService().getSavedUserId(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              //Provider.of<UserProvider>(context).currentUserId = snapshot.data;
              return const HomeScreen();
            } else {
              return const LoginScreen();
            }
          } else {
            return const AppLoadingIndicator();
          }
        },
      ),
    );
  }
}
