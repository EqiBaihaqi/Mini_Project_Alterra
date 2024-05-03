import 'package:flutter/material.dart';
import 'package:your_comfort_food/constant/color_constant.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingWidget extends StatelessWidget {
  final double widht;
  final double height;
  const ShimmerLoadingWidget(
      {super.key, required this.widht, required this.height});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: ColorConstant.whitishGray,
      child: Container(
        width: widht,
        height: height,
        color: ColorConstant.whitishGray,
      ),
    );
  }
}
