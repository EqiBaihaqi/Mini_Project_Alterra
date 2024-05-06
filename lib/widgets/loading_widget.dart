import 'package:flutter/material.dart';
import 'package:your_comfort_food/constant/color_constant.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWIdget extends StatelessWidget {
  final double width;
  const LoadingWIdget({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: LoadingAnimationWidget.inkDrop(
            color: ColorConstant.orangeColor, size: width));
  }
}
