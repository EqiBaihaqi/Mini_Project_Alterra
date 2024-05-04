import 'package:flutter/material.dart';
import 'package:your_comfort_food/constant/color_constant.dart';
import 'package:your_comfort_food/constant/text_style_constant.dart';

class SearchTextFormWidget extends StatelessWidget {
  final TextEditingController? controller;
  final bool readOnly;
  const SearchTextFormWidget(
      {super.key, required this.readOnly, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 295,
      height: 42,
      margin: const EdgeInsets.only(right: 20),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
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
            hintStyle: TextStyleConstant.poppinsRegular
                .copyWith(color: ColorConstant.grayColor3, height: 1.2),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: ColorConstant.grayColor3),
            )),
        readOnly: readOnly,
      ),
    );
  }
}
