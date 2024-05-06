import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'package:your_comfort_food/constant/color_constant.dart';
import 'package:your_comfort_food/widgets/bottom_navigation_bar/bottom_navigation_bar_view_model.dart';

class BottomNavCustom extends StatelessWidget {
  final int selectedNav;
  const BottomNavCustom({super.key, required this.selectedNav});

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<BottomNavigationProvider>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: DotNavigationBar(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          unselectedItemColor: Colors.grey,
          currentIndex: navigationProvider.currentIndex,
          splashBorderRadius: 50,
          onTap: (index) {
            navigationProvider.setIndex(index);
          },
          items: [
            DotNavigationBarItem(
              icon: const Icon(Icons.home_filled),
              selectedColor: ColorConstant.orangeColor,
            ),
            DotNavigationBarItem(
              icon: const Icon(Icons.search),
              selectedColor: ColorConstant.orangeColor,
            ),
            DotNavigationBarItem(
              icon: const Icon(Icons.fluorescent_rounded),
              selectedColor: ColorConstant.orangeColor,
            ),
          ]),
    );
  }
}
