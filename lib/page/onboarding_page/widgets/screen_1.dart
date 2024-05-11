import 'package:flutter/material.dart';
import 'package:your_comfort_food/constant/animation_constant.dart';
import 'package:your_comfort_food/constant/color_constant.dart';
import 'package:your_comfort_food/constant/text_style_constant.dart';
import 'package:lottie/lottie.dart';


class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Container(
       margin: const EdgeInsets.symmetric(horizontal: 22),
      color: ColorConstant.whitishGray,
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 150),
              child: Lottie.asset(AnimationConstant.food,
                  height: 350, width: 350)),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              'Includge in Culinary Delights!',
              style: TextStyleConstant.pacifioRegular
                  .copyWith(fontSize: 27, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Feast Your Eyes on Delicious Dishses and Get Ready to Explore Mouthwatering Recipe.',
              textAlign: TextAlign.center,
              style: TextStyleConstant.poppinsRegular.copyWith(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
