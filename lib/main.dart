import 'package:flutter/material.dart';
import 'package:matunda/screens/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fruits',
        theme: ThemeData(),
        home: const OnboardScreen());
  }
}
