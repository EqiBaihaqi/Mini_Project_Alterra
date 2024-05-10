import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:colorful_iconify_flutter/icons/emojione.dart';
import 'package:provider/provider.dart';
import 'package:your_comfort_food/constant/color_constant.dart';
import 'package:your_comfort_food/constant/text_style_constant.dart';
import 'package:your_comfort_food/page/detail_recipe/detail_recipe_view_model.dart';

class NutritionInformation extends StatelessWidget {
  const NutritionInformation({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DetailRecipeViewModel>(context);

    return SizedBox(
      width: 300,
      height: 452,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: const Iconify(
                Emojione.fire,
                size: 30,
              ),
              title: Text('Calories',
                  style: TextStyleConstant.poppinsRegular.copyWith()),
              trailing: Text('${provider.nutritionRecipeResponse.calories} g',
                  style: TextStyleConstant.poppinsRegular.copyWith()),
            ),
            ListTile(
              leading: const Iconify(
                Emojione.rice_cracker,
                size: 30,
              ),
              title: Text('Carbohydrate',
                  style: TextStyleConstant.poppinsRegular.copyWith()),
              trailing: Text('${provider.nutritionRecipeResponse.carbs} ',
                  style: TextStyleConstant.poppinsRegular.copyWith()),
            ),
            ListTile(
              leading: const Iconify(
                Emojione.cheese_wedge,
                size: 30,
              ),
              title: Text('Fat',
                  style: TextStyleConstant.poppinsRegular.copyWith()),
              trailing: Text('${provider.nutritionRecipeResponse.fat} ',
                  style: TextStyleConstant.poppinsRegular.copyWith()),
            ),
            ListTile(
              leading: Iconify(
                Emojione.chicken,
                color: ColorConstant.grayColor,
                size: 30,
              ),
              title: Text('Protein',
                  style: TextStyleConstant.poppinsRegular.copyWith()),
              trailing: Text('${provider.nutritionRecipeResponse.protein} ',
                  style: TextStyleConstant.poppinsRegular.copyWith()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Good Nutritions',
                    style:
                        TextStyleConstant.poppinsRegular.copyWith(fontSize: 20),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Iconify(Emojione.red_apple),
                ],
              ),
            ),
            SizedBox(
              height: 260,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  var dataGood = provider.nutritionRecipeResponse.good?[index];

                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              dataGood?.title ?? '',
                              style: TextStyleConstant.poppinsRegular.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 14.5),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${dataGood?.amount} (${dataGood?.percentOfDailyNeeds}% per day)',
                              style: TextStyleConstant.poppinsRegular
                                  .copyWith(fontSize: 15),
                            )),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
