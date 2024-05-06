import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:your_comfort_food/constant/color_constant.dart';
import 'package:your_comfort_food/constant/text_style_constant.dart';
import 'package:your_comfort_food/page/home_page/home_page_view_model.dart';
import 'package:your_comfort_food/page/home_page/home_category/recipe_all.dart';
import 'package:your_comfort_food/page/home_page/home_category/recipe_dairy_free.dart';
import 'package:your_comfort_food/page/home_page/home_category/recipe_vegan.dart';
import 'package:your_comfort_food/page/search_page/search_page.dart';
import 'package:your_comfort_food/widgets/category_button_widget.dart';
import 'package:your_comfort_food/widgets/search_text_form_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomePageViewModel>(context, listen: false).getRandomRecipe();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomePageViewModel>(context, listen: false).getVeganRecipe();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomePageViewModel>(context, listen: false)
          .getDairyFreeRecipe();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomePageViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        toolbarHeight: 80,
        title: Text(
          'Random Recipes for Today !',
          style: TextStyleConstant.poppinsRegular
              .copyWith(fontWeight: FontWeight.bold, fontSize: 23),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SearchTextFormWidget(
                      autoFocus: false,
                      width: 295,
                      height: 42,
                      readOnly: true,
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchPage())),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: ColorConstant.orangeColor),
                            borderRadius: BorderRadius.circular(12)),
                        child: IconButton(
                            onPressed: () {
                              provider.refreshRecipe();
                            },
                            icon: Icon(
                              Icons.refresh_rounded,
                              color: ColorConstant.orangeColor,
                              size: 23,
                            )))
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'Category',
                    style: TextStyleConstant.poppinsRegular
                        .copyWith(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CategoryButtonWidget(
                text: 'All',
                onTap: () {
                  provider.setAllRecipe();
                },
                color: provider.isAllClicked ? ColorConstant.orangeColor : null,
                textStyle: provider.isAllClicked
                    ? TextStyleConstant.poppinsRegular.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorConstant.whitishGray)
                    : TextStyleConstant.poppinsRegular.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorConstant.orangeColor),
              ),
              const SizedBox(
                width: 12,
              ),
              CategoryButtonWidget(
                text: 'Vegan',
                onTap: () {
                  provider.setVeganRecipe();
                },
                color:
                    provider.isVeganClicked ? ColorConstant.orangeColor : null,
                textStyle: provider.isVeganClicked
                    ? TextStyleConstant.poppinsRegular.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorConstant.whitishGray)
                    : TextStyleConstant.poppinsRegular.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorConstant.orangeColor),
              ),
              const SizedBox(
                width: 12,
              ),
              CategoryButtonWidget(
                text: 'Dairy Free',
                onTap: () {
                  provider.setDairyRecipe();
                },
                color:
                    provider.isDairyClicked ? ColorConstant.orangeColor : null,
                textStyle: provider.isDairyClicked
                    ? TextStyleConstant.poppinsRegular.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorConstant.whitishGray)
                    : TextStyleConstant.poppinsRegular.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorConstant.orangeColor),
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Expanded(child: _buildRecipeGridView(provider.selectRecipe)),
        ],
      ),
    );
  }

  Widget _buildRecipeGridView(RecipeType recipeType) {
    return Consumer<HomePageViewModel>(
      builder: (context, provider, child) {
        switch (recipeType) {
          case RecipeType.all:
            return const RecipeAllGridView();
          case RecipeType.vegan:
            return const RecipeVeganGridView();
          case RecipeType.dairyFree:
            return const RecipeDairyFreeGridView();
        }
      },
    );
  }
}
