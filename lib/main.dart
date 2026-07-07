import 'package:flutter/material.dart';
import 'package:krunal_portfolio/config/theme/app_theme.dart';
import 'package:krunal_portfolio/screens/home_screen.dart';

void main() {
  runApp(const MyPortfolio());
}


class MyPortfolio extends StatelessWidget {
  const MyPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Krunal Maisuriya - Application Developer',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: HomeScreen(),
    );
  }
}