import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:your_comfort_food/page/alternate_ingredient/alternate_ingredient_page.dart';
import 'package:your_comfort_food/page/home_page/home_page.dart';
import 'package:your_comfort_food/page/home_page/home_page_view_model.dart';
import 'package:your_comfort_food/page/search_page/search_page.dart';
import 'package:your_comfort_food/widgets/bottom_navigation_bar/bottom_navigation_bar_view_model.dart';
import 'package:your_comfort_food/widgets/bottom_navigation_bar/bottom_navigation_bar_widget.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomePageViewModel>(context, listen: false).getRandomRecipe();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomePageViewModel>(context, listen: false).getVeganRecipe();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomePageViewModel>(context, listen: false)
          .getDairyFreeRecipe();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<BottomNavigationProvider>(context);
    List<Widget> body = [
      const HomePage(),
      const SearchPage(autoFocus: false),
      const AlternateIngredientPage(),
    ];
    return Scaffold(
      extendBody: true,
      body: body[navigationProvider.currentIndex],
      bottomNavigationBar: const BottomNavCustom(),
    );
  }
}
