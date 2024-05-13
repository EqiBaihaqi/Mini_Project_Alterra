import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:your_comfort_food/constant/constant.dart';
import 'package:your_comfort_food/constant/text_style_constant.dart';
import 'package:your_comfort_food/page/detail_recipe/detail_recipe_view_model.dart';

class EquipmentWidget extends StatelessWidget {
  const EquipmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DetailRecipeViewModel>(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      height: 144,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: provider.equipmentResponse.equipment?.length,
        itemBuilder: (context, index) {
          var data = provider.equipmentResponse.equipment?[index];
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            NetworkImage('$baseUrlEquipment${data?.image}'))),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  data?.name ?? '',
                  style: TextStyleConstant.poppinsRegular.copyWith(
                    fontSize: 13.5,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
