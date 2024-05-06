import 'package:flutter/material.dart';
import 'package:your_comfort_food/constant/color_constant.dart';
import 'package:your_comfort_food/constant/text_style_constant.dart';

class SearchTextFormWidget extends StatelessWidget {
  final double width;
  final double height;
  final bool autoFocus;
  final TextEditingController? controller;
  final bool? readOnly;
  final Function()? onTap;
  final Function(String)? onSubmitted;
  const SearchTextFormWidget(
      {super.key,
      this.readOnly,
      this.controller,
      this.onTap,
      this.onSubmitted,
      required this.width,
      required this.height,
      required this.autoFocus});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        autofocus: autoFocus,
        onFieldSubmitted: onSubmitted,
        textAlign: TextAlign.left,
        controller: controller,
        keyboardType: TextInputType.text,
        onTap: onTap,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(3.0),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: ColorConstant.orangeColor,
                )),
            hintText: 'Search Recipe',
            alignLabelWithHint: true,
            prefixIcon: Icon(
              Icons.search,
              color: ColorConstant.grayColor3,
              size: 30,
            ),
            hintStyle: TextStyleConstant.poppinsRegular.copyWith(
              color: ColorConstant.grayColor3,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: ColorConstant.grayColor3),
            )),
        readOnly: readOnly ?? false,
      ),
    );
  }
}
