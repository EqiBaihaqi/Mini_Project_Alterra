import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:colorful_iconify_flutter/icons/emojione.dart';
import 'package:provider/provider.dart';
import 'package:your_comfort_food/constant/text_style_constant.dart';
import 'package:your_comfort_food/page/detail_recipe/detail_recipe_view_model.dart';

class NutritionContentWidget extends StatelessWidget {
  const NutritionContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DetailRecipeViewModel>(context);
    var data = provider.nutritionRecipeResponse;
    return SizedBox(
      width: 350,
      height: 520,
      child: Column(
        children: [
          ListTile(
            leading: const Iconify(
              Emojione.fire,
              size: 37,
            ),
            title: Text(
              'Calories',
              style: TextStyleConstant.poppinsRegular.copyWith(fontSize: 16),
            ),
            trailing: Text('${data.calories}'),
          ),
          ListTile(
            leading: const Iconify(
              Emojione.fire,
              size: 37,
            ),
            title: Text('Carbohydrates',
                style: TextStyleConstant.poppinsRegular.copyWith(fontSize: 16)),
            trailing: Text('${data.carbs}'),
          ),
          ListTile(
            leading: const Iconify(
              Emojione.fire,
              size: 37,
            ),
            title: Text('Protein',
                style: TextStyleConstant.poppinsRegular.copyWith(fontSize: 16)),
            trailing: Text('${data.protein}'),
          ),
          ListTile(
            leading: const Iconify(
              Emojione.fire,
              size: 37,
            ),
            title: Text('Fat',
                style: TextStyleConstant.poppinsRegular.copyWith(fontSize: 16)),
            trailing: Text('${data.fat}'),
          ),
          Container(
            margin: const EdgeInsets.only(left: 6, top: 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text(
                    'Good Nutrititon',
                    style:
                        TextStyleConstant.poppinsRegular.copyWith(fontSize: 19),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Iconify(
                    Emojione.red_apple,
                    size: 27,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 265,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 14),
              child: ListView.builder(
                itemCount: data.good?.length,
                itemBuilder: (context, index) {
                  var dataGood = data.good?[index];
                  return Column(
                    children: [
                      Text(
                        dataGood?.title ?? '',
                        style: TextStyleConstant.poppinsRegular.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        'Amount : ${dataGood?.amount}/${dataGood?.percentOfDailyNeeds}% a day',
                        style: TextStyleConstant.poppinsRegular,
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
