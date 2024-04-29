import 'package:flutter/material.dart';
import 'package:your_comfort_food/page/splash_page/logo_splash.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenLogo(),
    );
  }
}
