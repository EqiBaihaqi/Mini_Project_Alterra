import 'package:flutter/material.dart';
import 'package:your_comfort_food/constant/color_constant.dart';

import 'package:your_comfort_food/constant/text_style_constant.dart';

class SearchContainerWidGet extends StatelessWidget {
  final String title;
  final String image;
  const SearchContainerWidGet(
      {super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.darken),
              fit: BoxFit.cover,
              image: AssetImage(image))),
      child: Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyleConstant.josefinSansRegular.copyWith(
                color: ColorConstant.whitishGray,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          )),
    );
  }
}
