import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:your_comfort_food/constant/text_style_constant.dart';
import 'package:your_comfort_food/page/detail_recipe/detail_recipe_view_model.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class DescriptionRecipe extends StatelessWidget {
  const DescriptionRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DetailRecipeViewModel>(context);
    var data = provider.detailRecipeResponse;
    return Container(
      margin: const EdgeInsets.all(8),
      width: double.infinity,
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: [
            HtmlWidget(
              data?.summary ?? '',
              textStyle:
                  TextStyleConstant.poppinsRegular.copyWith(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
