import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/dictionary_provider.dart';
import 'providers/navigation_bar_provider.dart';
import 'providers/test_provider.dart';
import 'providers/user_provider.dart';
import 'routes.dart';
import 'screens/auth/login_screen.dart';

void main() {
  runApp(
    const DictionaryPal(),
  );
}

class DictionaryPal extends StatelessWidget {
  const DictionaryPal({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppNavigationBarProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DictionaryProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => TestProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: const LoginScreen(),
        initialRoute: AppRoutes.initial,
        routes: appRoutes,
      ),
    );
  }
}
