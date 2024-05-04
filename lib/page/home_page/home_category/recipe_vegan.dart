import 'package:flutter/material.dart';
import 'package:your_comfort_food/constant/color_constant.dart';
import 'package:your_comfort_food/constant/text_style_constant.dart';
import 'package:provider/provider.dart';
import 'package:your_comfort_food/page/home_page/home_page_view_model.dart';
import 'package:your_comfort_food/widgets/shimmer_loading_widget.dart';

class RecipeVeganGridView extends StatelessWidget {
  const RecipeVeganGridView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    final veganRecipeProvider = Provider.of<HomePageViewModel>(context);
    return RefreshIndicator(
      onRefresh: () async {
        veganRecipeProvider.getVeganRecipe();
      },
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // number of items in each row
            mainAxisSpacing: 12.0, // spacing between rows
            crossAxisSpacing: 12.0, // spacing between columns
          ),
          padding: const EdgeInsets.all(6.0),
          // padding around the grid
          itemCount: veganRecipeProvider
              .veganRecipeResponse.recipes?.length, // total number of items
          itemBuilder: (context, index) {
            var data = veganRecipeProvider.veganRecipeResponse.recipes?[index];

            if (veganRecipeProvider.isLoadingVeganRecipe) {
              return const ShimmerLoadingWidget(
                widht: 250,
                height: 250,
              );
            } else if (veganRecipeProvider.errorVeganRecipe != null) {
              return Center(
                child: Text(veganRecipeProvider.errorVeganRecipe!),
              );
            } else {
              return Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4), BlendMode.darken),
                        image: NetworkImage(
                          '${data?.image}',
                        ),
                        fit: BoxFit.cover)),
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 10, bottom: 10, right: 10, top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 60,
                            height: 20,
                            decoration: BoxDecoration(
                                color: ColorConstant.orangeColor1,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: ColorConstant.orangeColor2,
                                  size: 17,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  '${data?.spoonacularScore?.toStringAsFixed(1)}',
                                  style: TextStyleConstant.poppinsRegular
                                      .copyWith(color: ColorConstant.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${data?.title}',
                            style: TextStyleConstant.poppinsRegular.copyWith(
                                color: ColorConstant.whitishGray,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.food_bank_outlined,
                                color: ColorConstant.white,
                                size: 17,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                '${data?.servings.toString()} Serving',
                                style: TextStyleConstant.poppinsRegular
                                    .copyWith(
                                        color: ColorConstant.white,
                                        fontWeight: FontWeight.w100,
                                        fontSize: 12),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
