import 'package:flutter/material.dart';
import 'package:your_comfort_food/constant/color_constant.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingTextWidget extends StatelessWidget {
  final double width;
  const LoadingTextWidget({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: LoadingAnimationWidget.prograssiveDots(
              color: ColorConstant.orangeColor, size: width)),
    );
  }
}
