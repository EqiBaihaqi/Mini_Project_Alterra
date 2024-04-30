import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:your_comfort_food/constant/color_constant.dart';
import 'package:your_comfort_food/constant/image_constant.dart';
import 'package:your_comfort_food/constant/text_style_constant.dart';
import 'package:your_comfort_food/page/home_page/home_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            ImageConstant.landingPage,
            fit: BoxFit.cover,
          ),
          Center(
              child: Column(
            children: [
              const SizedBox(
                height: 74,
              ),
              SizedBox(
                height: 89,
                width: 89,
                child: Image.asset(
                  ImageConstant.logo,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Text('Your Comfort Food',
                  style: TextStyleConstant.pacifioRegular.copyWith(
                    color: ColorConstant.whitishGray,
                    fontSize: 19,
                  )),
            ],
          )),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Get\nCooking',
                style: TextStyleConstant.josefinSansRegular.copyWith(
                    fontSize: 50,
                    color: ColorConstant.whitishGray,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Cook up Comfort, One Recipe at a Time !',
                style: TextStyleConstant.josefinSansRegular
                    .copyWith(color: ColorConstant.whitishGray, fontSize: 17.5),
              ),
              const SizedBox(
                height: 64,
              ),
              Container(
                height: 54,
                margin: const EdgeInsets.symmetric(horizontal: 66),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          ColorConstant.orangeColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), // Adjust the radius as needed
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Get Started',
                          style: TextStyleConstant.josefinSansRegular.copyWith(
                              fontSize: 20, color: ColorConstant.whitishGray),
                        ),
                        const SizedBox(
                          width: 9,
                        ),
                        Icon(
                          Icons.arrow_right_alt,
                          size: 30,
                          color: ColorConstant.whitishGray,
                        )
                      ],
                    )),
              ),
              const SizedBox(
                height: 84,
              ),
            ],
          )
        ],
      ),
    );
  }
}
