import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_comfort_food/constant/text_style_constant.dart';
import 'package:your_comfort_food/page/alternate_ingredient/alternate_ingredient_view_model.dart';
import 'package:your_comfort_food/widgets/loading_text_widget.dart';

class TextResponseWidget extends StatelessWidget {
  const TextResponseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AlternateIngredientViewModel>(context);
    return provider.isLoading
        ? const Center(
            child: LoadingTextWidget(
              width: 50,
            ),
          )
        : Center(
            child: Text(
            provider.response ?? '',
            style: TextStyleConstant.poppinsRegular.copyWith(fontSize: 25),
          ));
  }
}
