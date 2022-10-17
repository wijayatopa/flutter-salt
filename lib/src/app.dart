import 'package:belajar_flutter/src/screens/full.dart';
import 'package:belajar_flutter/src/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Belajar Dengan SALT',
      home: SplashScreen(),
    );
  }
}
