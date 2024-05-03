import 'package:flutter/material.dart';
import 'package:your_comfort_food/constant/color_constant.dart';
import 'package:your_comfort_food/constant/text_style_constant.dart';

class SearchWidget extends StatelessWidget {
  final Function()? onTap;
  const SearchWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 295,
        height: 42,
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
            border: Border.all(color: ColorConstant.grayColor3),
            borderRadius: BorderRadius.circular(12)),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: ColorConstant.grayColor3,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Search recipe',
                    style: TextStyleConstant.poppinsRegular.copyWith(
                        color: ColorConstant.grayColor3, fontSize: 17),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
