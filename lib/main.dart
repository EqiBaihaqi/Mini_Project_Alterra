import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_comfort_food/page/detail_recipe/detail_recipe_view_model.dart';
import 'package:your_comfort_food/page/home_page/home_page_view_model.dart';
import 'package:your_comfort_food/page/search_page/search_page_view_model.dart';
import 'package:your_comfort_food/page/splash_page/logo_splash.dart';
import 'package:your_comfort_food/widgets/bottom_navigation_bar/bottom_navigation_bar_view_model.dart';

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
            create: (context) => BottomNavigationProvider()),
        ChangeNotifierProvider<HomePageViewModel>(
            create: (context) => HomePageViewModel()),
        ChangeNotifierProvider<SearchPageViewModel>(
            create: (context) => SearchPageViewModel()),
        ChangeNotifierProvider<DetailRecipeViewModel>(
            create: (context) => DetailRecipeViewModel())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreenLogo(),
      ),
    );
  }
}
