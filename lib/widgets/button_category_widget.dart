import 'package:flutter/material.dart';
import 'package:your_comfort_food/constant/color_constant.dart';

class ButtonCategoryWidget extends StatelessWidget {
  final Function()? onTap;
  final Color? color;
  final TextStyle? textStyle;
  final String? text;
  final double width;
  final double height;
  const ButtonCategoryWidget(
      {super.key,
      this.onTap,
      this.color,
      this.textStyle,
      this.text,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border:
                    Border.all(width: 1.2, color: ColorConstant.orangeColor),
                color: color),
            child: Center(child: Text(text ?? '', style: textStyle))));
  }
}
