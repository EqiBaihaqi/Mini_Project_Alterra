import 'package:flutter/material.dart';
import 'package:your_comfort_food/constant/color_constant.dart';
import 'package:your_comfort_food/constant/image_constant.dart';
import 'package:your_comfort_food/constant/text_style_constant.dart';
import 'package:your_comfort_food/page/home.dart';
import 'package:your_comfort_food/page/onboarding_page/landing_page.dart';
import 'package:your_comfort_food/utils/shared_pref.dart';

class SplashScreenLogo extends StatefulWidget {
  const SplashScreenLogo({super.key});

  @override
  State<SplashScreenLogo> createState() => _SplashScreenLogoState();
}

class _SplashScreenLogoState extends State<SplashScreenLogo> {
  void checkToken() async {
    final token = await SharedPrefLogin.getUsername();

    Future.delayed(const Duration(seconds: 3), () {
      if (token != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Home()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OnboardingPage()));
      }
    });
  }

  @override
  void initState() {
    checkToken();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whitishGray,
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 80, height: 80, child: Image.asset(ImageConstant.logo1)),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Your Comfort Food',
              style: TextStyleConstant.pacifioRegular
                  .copyWith(fontWeight: FontWeight.w100),
            )
          ],
        )),
      ),
    );
  }
}
