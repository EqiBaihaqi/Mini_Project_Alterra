import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_comfort_food/constant/text_style_constant.dart';
import 'package:your_comfort_food/page/alternate_ingredient/alternate_ingredient_view_model.dart';
import 'package:your_comfort_food/widgets/loading_text_widget.dart';

class ResponseAI extends StatefulWidget {
  const ResponseAI({super.key});

  @override
  State<ResponseAI> createState() => _ResponseAIState();
}

class _ResponseAIState extends State<ResponseAI> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AlternateIngredientViewModel>(context);
    if (provider.isLoading) {
      return const Center(
        child: LoadingTextWidget(
          width: 45,
        ),
      );
    } else {
      return Center(
          child: Text(
        provider.response ?? '',
        style: TextStyleConstant.poppinsRegular.copyWith(fontSize: 25),
      ));
    }
  }
}
