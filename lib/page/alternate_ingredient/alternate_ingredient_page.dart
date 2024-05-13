import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_comfort_food/constant/color_constant.dart';
import 'package:your_comfort_food/constant/image_constant.dart';
import 'package:your_comfort_food/constant/text_style_constant.dart';
import 'package:your_comfort_food/page/alternate_ingredient/alternate_ingredient_view_model.dart';
import 'package:your_comfort_food/page/alternate_ingredient/widgets/response_ai.dart';

class AlternateIngredientPage extends StatefulWidget {
  const AlternateIngredientPage({super.key});

  @override
  State<AlternateIngredientPage> createState() =>
      _AlternateIngredientPageState();
}

class _AlternateIngredientPageState extends State<AlternateIngredientPage> {
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AlternateIngredientViewModel>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Alternative Ingredient',
          style: TextStyleConstant.josefinSansRegular.copyWith(
              color: ColorConstant.whitishGray,
              fontSize: 32,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4), BlendMode.darken),
                fit: BoxFit.cover,
                image: AssetImage(ImageConstant.backgroundIngredient))),
        child: Container(
          margin: const EdgeInsets.only(top: 160),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Text(
                  'What Alternative Ingredient Do You Need?',
                  textAlign: TextAlign.center,
                  style: TextStyleConstant.josefinSansRegular.copyWith(
                      color: ColorConstant.whitishGray,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 55,
                  margin: const EdgeInsets.only(left: 30, top: 30, right: 30),
                  child: TextFormField(
                    controller: controller,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: 'Input Ingredient',
                        hintStyle: TextStyleConstant.josefinSansRegular
                            .copyWith(fontSize: 15),
                        fillColor: ColorConstant.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(),
                            borderRadius: BorderRadius.circular(23))),
                  ),
                ),
                Container(
                  width: 130,
                  height: 45,
                  margin: const EdgeInsets.only(top: 32),
                  child: ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      provider.getGeminiResponse(controller.text);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstant.orangeColor),
                    child: Text(
                      'Submit',
                      style: TextStyleConstant.poppinsRegular.copyWith(
                          color: ColorConstant.whitishGray, fontSize: 20),
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(left: 30, right: 30, top: 26),
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        color: ColorConstant.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: const ResponseAI())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
