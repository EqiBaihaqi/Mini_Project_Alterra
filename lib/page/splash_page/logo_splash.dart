import 'package:flutter/material.dart';
import 'package:your_comfort_food/constant/color_constant.dart';
import 'package:your_comfort_food/constant/image_constant.dart';
import 'package:your_comfort_food/constant/text_style_constant.dart';
import 'package:your_comfort_food/page/splash_page/landing_page.dart';

class SplashScreenLogo extends StatefulWidget {
  const SplashScreenLogo({super.key});

  @override
  State<SplashScreenLogo> createState() => _SplashScreenLogoState();
}

class _SplashScreenLogoState extends State<SplashScreenLogo> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LandingPage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.black,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImageConstant.logoBlack,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'Your Comfort Food',
            style: TextStyleConstant.pacifioRegular
                .copyWith(fontWeight: FontWeight.w100),
          )
        ],
      )),
    );
  }
}
