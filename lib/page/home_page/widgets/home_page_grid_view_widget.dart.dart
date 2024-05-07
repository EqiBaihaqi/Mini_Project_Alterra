import 'package:flutter/material.dart';
import 'package:your_comfort_food/constant/color_constant.dart';
import 'package:your_comfort_food/constant/constant.dart';
import 'package:your_comfort_food/constant/text_style_constant.dart';
import 'package:your_comfort_food/model/random_recipes_response.dart';
import 'package:your_comfort_food/page/detail_recipe/detail_recipe_page.dart';


class HomePageGridViewWidget extends StatelessWidget {
  final Function() onRefresh;
  final String? error;
  final RandomRecipeResponse? dataApi;
  final int? dataLength;

  const HomePageGridViewWidget({
    super.key,
    required this.onRefresh,
    this.error,
    this.dataApi,
    this.dataLength,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        onRefresh;
      },
      child: ListView.builder(

          // padding around the grid
          itemCount: dataLength, // total number of items
          itemBuilder: (context, index) {
            var data = dataApi?.recipes?[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailRecipe(
                              idRecipe: data?.id,
                            )));
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                width: 315,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4), BlendMode.darken),
                        image: NetworkImage(
                          data?.image ?? noImageUrl,
                        ),
                        fit: BoxFit.cover)),
                child: Container(
                  margin: const EdgeInsets.all(10),
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
                                fontSize: 19,
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
                                size: 21,
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
                                        fontSize: 16),
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
              ),
            );
          }),
    );
  }
}
