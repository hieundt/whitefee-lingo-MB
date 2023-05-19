import 'package:dictionary/data/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'providers/dictionary_provider.dart';
import 'providers/navigation_bar_provider.dart';
import 'providers/test_provider.dart';
import 'providers/user_provider.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  String? currentUserId = await UserService().getSavedUserId();
  print(currentUserId);

  runApp(
    MultiProvider(
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
        initialRoute: currentUserId == null ? AppRoutes.login : AppRoutes.home,
        routes: appRoutes,
      ),
    ),
  );
}

// class DictionaryPal extends StatelessWidget {
//   const DictionaryPal({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
