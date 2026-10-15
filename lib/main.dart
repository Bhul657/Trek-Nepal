
import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const TrekNepalApp());
}

class TrekNepalApp extends StatelessWidget {
  const TrekNepalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TrekNepal',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF159E89),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}
