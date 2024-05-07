import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_comfort_food/constant/color_constant.dart';
import 'package:your_comfort_food/constant/constant.dart';
import 'package:your_comfort_food/constant/text_style_constant.dart';
import 'package:your_comfort_food/page/detail_recipe/detail_recipe_view_model.dart';

class IngredientListView extends StatelessWidget {
  const IngredientListView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DetailRecipeViewModel>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: provider.detailRecipeResponse?.extendedIngredients?.length,
        itemBuilder: (context, index) {
          var data = provider.detailRecipeResponse?.extendedIngredients?[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
            decoration: BoxDecoration(
                color: ColorConstant.grayColor2,
                borderRadius: BorderRadius.circular(12)),
            width: double.infinity,
            height: 86,
            child: Align(
              alignment: Alignment.centerLeft,
              child: ListTile(
                leading: Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              '$baseUrlImageIngredient${data?.image}'))),
                ),
                title: Text(
                  data?.aisle ?? '',
                  style: TextStyleConstant.poppinsRegular.copyWith(
                      color: ColorConstant.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  '${data?.amount}g',
                  style: TextStyleConstant.poppinsRegular
                      .copyWith(color: ColorConstant.grayColor4, fontSize: 15),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
