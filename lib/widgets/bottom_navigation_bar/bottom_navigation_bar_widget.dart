import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:your_comfort_food/constant/color_constant.dart';

import 'package:your_comfort_food/widgets/bottom_navigation_bar/bottom_navigation_bar_view_model.dart';
import 'package:floating_navigation_bar/floating_navigation_bar.dart';


class BottomNavCustom extends StatelessWidget {
  const BottomNavCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<BottomNavigationProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: FloatingNavigationBar(
          backgroundColor: ColorConstant.whitishGray,
          iconSize: 30,
          indicatorColor: ColorConstant.orangeColor,
          indicatorHeight: 5,
          indicatorWidth: 14.0,
          barHeight: 53,
          textStyle: const TextStyle(fontSize: 0),
          iconColor: ColorConstant.orangeColor2,
          onChanged: (index) {
            navigationProvider.setIndex(index);
          },
          items: [
            NavBarItems(
              icon: Icons.home,
              title: '',
            ),
            NavBarItems(
              icon: Icons.search,
              title: '',
            ),
            NavBarItems(
              icon: Icons.fluorescent_rounded,
              title: '',
            ),
          ]),
    );
  }
}
