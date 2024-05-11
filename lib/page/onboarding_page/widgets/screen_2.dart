import 'package:flutter/material.dart';
import 'package:your_comfort_food/constant/animation_constant.dart';
import 'package:your_comfort_food/constant/color_constant.dart';
import 'package:your_comfort_food/constant/text_style_constant.dart';
import 'package:lottie/lottie.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstant.whitishGray,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 110),
            child: Text(
              'Experience The Joy of Cooking',
              style: TextStyleConstant.pacifioRegular.copyWith(fontSize: 27),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 40),
              child: Lottie.asset(AnimationConstant.cook,
                  height: 350, width: 350)),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Savor Every Bite and Experience The Pleasure of Comfort Food',
              textAlign: TextAlign.center,
              style: TextStyleConstant.pacifioRegular
                  .copyWith(fontSize: 27, fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }
}
