import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/models/user_models/user_model.dart';
import 'data/services/user_service.dart';
import 'providers/user_provider.dart';
import 'screens/auth/login_screen.dart';
import 'screens/home/home_sceen.dart';
import 'utils.dart';

class InitialState extends StatelessWidget {
  const InitialState({super.key});

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context).currentUser;
    return Scaffold(
      body: FutureBuilder<User?>(
        future: UserService().getUserById(userProvider?.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
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
