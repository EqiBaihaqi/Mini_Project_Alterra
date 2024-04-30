import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_comfort_food/page/splash_page/logo_splash.dart';
import 'package:your_comfort_food/utils/navigation_bar_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomNavigationProvider>(
            create: (context) => BottomNavigationProvider())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreenLogo(),
      ),
    );
  }
}
