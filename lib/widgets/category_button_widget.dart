import 'package:flutter/material.dart';
import 'package:your_comfort_food/constant/color_constant.dart';

class CategoryButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final Color? color;
  final TextStyle? textStyle;
  final String? text;
  const CategoryButtonWidget(
      {super.key, this.onTap, this.color, this.textStyle, this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            width: 120,
            height: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border:
                    Border.all(width: 1.2, color: ColorConstant.orangeColor),
                color: color),
            child: Center(child: Text(text ?? '', style: textStyle))));
  }
}
