import 'package:dictionary/navigator/navigation_sceen.dart';
import 'package:dictionary/screens/dictionary/dictionary_screen.dart';
import 'package:dictionary/screens/training/training_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NavigatorScreen(),
    );
  }
}
