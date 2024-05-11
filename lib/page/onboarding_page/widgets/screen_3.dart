import 'package:flutter/material.dart';
import 'package:your_comfort_food/constant/animation_constant.dart';
import 'package:your_comfort_food/constant/color_constant.dart';
import 'package:your_comfort_food/constant/text_style_constant.dart';
import 'package:lottie/lottie.dart';
import 'package:your_comfort_food/page/home.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstant.whitishGray,
      margin: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 150),
              child:
                  Lottie.asset(AnimationConstant.eat, height: 350, width: 350)),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              'Whip Up Your Favorite Recipe!',
              textAlign: TextAlign.center,
              style: TextStyleConstant.pacifioRegular.copyWith(fontSize: 27),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Turn Your Kitchen Into a Culinary Haven',
              textAlign: TextAlign.center,
              style:
                  TextStyleConstant.josefinSansRegular.copyWith(fontSize: 22),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                  (route) => false);
            },
            child: Container(
                margin: const EdgeInsets.only(top: 14),
                width: 220,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: ColorConstant.orangeColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Let\'s Get Cooking!',
                    style: TextStyleConstant.poppinsRegular.copyWith(
                        color: ColorConstant.whitishGray,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
