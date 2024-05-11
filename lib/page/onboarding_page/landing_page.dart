
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:your_comfort_food/constant/color_constant.dart';

import 'package:your_comfort_food/page/onboarding_page/widgets/screen_2.dart';
import 'package:your_comfort_food/page/onboarding_page/widgets/screen_1.dart';
import 'package:your_comfort_food/page/onboarding_page/widgets/screen_3.dart';


class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: const [
              Screen1(),
              Screen2(),
              Screen3(),
            ],
          ),
          Container(
              alignment: const Alignment(0, 0.80),
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: ExpandingDotsEffect(
                    dotWidth: 13.5,
                    dotHeight: 13.5,
                    activeDotColor: ColorConstant.orangeColor),
              )),
        ],
      ),
    );
  }
}
