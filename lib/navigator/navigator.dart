import 'package:flutter/material.dart';

class NavigatorScreen extends StatelessWidget {
  const NavigatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Text('Home'),
        actions: const [
          Icon(Icons.person),
        ],
      ),
    );
  }
}
