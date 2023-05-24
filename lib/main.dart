import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'providers/dictionary_provider.dart';
import 'providers/navigation_bar_provider.dart';
import 'providers/test_provider.dart';
import 'routes.dart';

late final SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  String? id = prefs.getString('userId');
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: ' Dictionary Pal',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: id == null ? AppRoutes.login : AppRoutes.home,
        routes: appRoutes,
      ),
    ),
  );
}
